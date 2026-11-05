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
    float2 _287 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_287, float2(0.0), isnan(_287))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_287, float2(0.0), isnan(_287))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _304 = float2(_57, _59);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_304, float2(0.0), isnan(_304))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_304, float2(0.0), isnan(_304))).x;
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
    float _113 = _99 * _107;
    float _115 = _91 * _107;
    float _117 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _119 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _121 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _123 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = _85 * _107;
    float _129 = _93 * _107;
    float _131 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[11].x, _117);
    float _133 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[11].z, _119);
    float _135 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[11].w, _121);
    float _137 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = 1.0 / _89;
    float _143 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _145 = precise::clamp(_143, 0.0, 1.0);
    float _147 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[12].x, _131);
    float _149 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[12].z, _133);
    float _151 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[12].w, _135);
    float _153 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].x, _147);
    float _159 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].w, _151);
    float _165 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].z, _149);
    float _167 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[14].x, _157);
    float _169 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[14].z, _165);
    float _171 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[15].x, _167);
    float _173 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[14].w, _163);
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _177 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[0].w, _175);
    float _179 = -_171;
    float _181 = _113 + _179;
    float _183 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[15].z, _169);
    float _185 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[27].x, (*spvDescriptorSet0.fp_c3)._m0[27].y);
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[15].w, _173);
    float _191 = -(*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _193 = _191 + (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _195 = _187 * _187;
    float _197 = _183;
    if (!_83)
    {
        float _199 = _183 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = _189 * _181;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = fma(_195, _193, (*spvDescriptorSet0.fp_c3)._m0[28].x);
    float _213 = _201 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _215 = _209 * _209;
    float _217 = _205 * _211;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = -_213;
    float _223 = _221 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _225 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[28].z, _219);
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[34].z, _213);
    float _231 = -_205;
    float _233 = _231 + _227;
    float _235 = _229 * _227;
    float _237 = _229 * _233;
    float _239 = _115 * _237;
    float _241 = _127 * _237;
    float _243 = _129 * _237;
    float _245 = _115 * _235;
    float _247 = _127 * _235;
    float _249 = _129 * _235;
    float _251 = precise::max(_239, _241);
    float _253 = precise::max(_243, _251);
    out.m_34.x = _245;
    out.m_34.y = _247;
    out.m_34.z = _249;
    out.m_34.w = _253;
    return out;
}

