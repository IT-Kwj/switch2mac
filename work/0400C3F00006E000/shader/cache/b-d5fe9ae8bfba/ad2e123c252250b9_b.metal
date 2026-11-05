#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _303 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_303, float2(0.0), isnan(_303))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _320 = float2(_57, _59);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_320, float2(0.0), isnan(_320))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_320, float2(0.0), isnan(_320))).x;
    bool _75 = _57 >= (*spvDescriptorSet0.fp_c3)._m0[35].x;
    bool _77 = isnan(_57);
    bool _79 = _75 || _77;
    bool _81 = isnan((*spvDescriptorSet0.fp_c3)._m0[35].x);
    bool _83 = _79 || _81;
    float _85 = precise::min(_67, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _87 = -_71;
    float _89 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _91 = precise::min(_65, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _93 = precise::min(_69, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _95 = _85 * 0.715200006961822509765625;
    float _97 = fma(_91, 0.2125999927520751953125, _95);
    float _99 = fma(_93, 0.072200000286102294921875, _97);
    float _101 = 1.0 / _99;
    float _103 = _101 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = _91 * _107;
    float _115 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _85 * _107;
    float _121 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _123 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _125 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _127 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _129 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[11].x, _121);
    float _135 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[11].y, _123);
    float _137 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[11].z, _125);
    float _139 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[11].w, _127);
    float _141 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[12].x, _133);
    float _143 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _145 = precise::clamp(_143, 0.0, 1.0);
    float _147 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[12].y, _135);
    float _149 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[12].z, _137);
    float _151 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[12].w, _139);
    float _153 = 1.0 / _89;
    float _155 = _99 * _107;
    float _157 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].x, _141);
    float _163 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].y, _147);
    float _165 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].z, _149);
    float _167 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].w, _151);
    float _169 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[14].x, _161);
    float _175 = 1.0 / _155;
    float _177 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[14].y, _163);
    float _179 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[14].z, _165);
    float _181 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[14].w, _167);
    float _183 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[15].x, _173);
    float _185 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[15].y, _177);
    float _187 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[15].z, _179);
    float _189 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[15].w, _181);
    float _191 = -_183;
    float _193 = _155 + _191;
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _197 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[0].w, _195);
    float _199 = _187;
    if (!_83)
    {
        float _201 = _187 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _199 = _201;
    }
    float _203 = _199;
    float _205 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[27].x, (*spvDescriptorSet0.fp_c3)._m0[27].y);
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = _185 * _175;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = _189 * _193;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _223 = _221 + (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _225 = _207 * _207;
    float _227 = _215 * _215;
    float _229 = _203 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _231 = _219 * _211;
    float _233 = fma(_225, _223, (*spvDescriptorSet0.fp_c3)._m0[28].x);
    float _235 = _227 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _237 = -_229;
    float _239 = _237 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _241 = _93 * _107;
    float _243 = fma(_231, _233, _235);
    float _245 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[34].z, _229);
    float _247 = -_231;
    float _249 = _247 + _243;
    float _251 = _245 * _243;
    float _253 = _245 * _249;
    float _255 = _113 * _253;
    float _257 = _119 * _253;
    float _259 = _241 * _253;
    float _261 = _113 * _251;
    float _263 = _119 * _251;
    float _265 = _241 * _251;
    float _267 = precise::max(_255, _257);
    float _269 = precise::max(_259, _267);
    out.m_34.x = _261;
    out.m_34.y = _263;
    out.m_34.z = _265;
    out.m_34.w = _269;
    return out;
}

