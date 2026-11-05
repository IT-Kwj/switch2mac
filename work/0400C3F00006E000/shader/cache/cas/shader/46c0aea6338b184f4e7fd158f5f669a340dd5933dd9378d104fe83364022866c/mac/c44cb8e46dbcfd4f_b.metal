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
    float2 _285 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_285, float2(0.0), isnan(_285))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_285, float2(0.0), isnan(_285))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _302 = float2(_57, _59);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_302, float2(0.0), isnan(_302))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_302, float2(0.0), isnan(_302))).x;
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
    float _97 = 1.0 / _89;
    float _99 = fma(_91, 0.2125999927520751953125, _95);
    float _101 = fma(_93, 0.072200000286102294921875, _99);
    float _103 = 1.0 / _101;
    float _105 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _107 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[0].w, _105);
    float _109 = _103 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _91 * _113;
    float _121 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = _85 * _113;
    float _127 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _129 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _131 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _137 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[11].z, _127);
    float _139 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _141 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[11].x, _129);
    float _147 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[12].z, _137);
    float _149 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[11].y, _135);
    float _151 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[11].w, _139);
    float _153 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].z, _147);
    float _159 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[12].x, _145);
    float _161 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[12].y, _149);
    float _163 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[12].w, _151);
    float _165 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[14].z, _157);
    float _171 = _101 * _113;
    float _173 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].x, _159);
    float _175 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[15].z, _169);
    float _177 = 1.0 / _171;
    float _179 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].y, _161);
    float _181 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = _175;
    if (!_83)
    {
        float _187 = _175 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _185 = _187;
    }
    float _189 = _185;
    float _191 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].w, _163);
    float _193 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[14].x, _173);
    float _195 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[14].y, _179);
    float _197 = _189 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _199 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[14].w, _191);
    float _201 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[15].x, _193);
    float _203 = _183 * _183;
    float _205 = -_197;
    float _207 = _205 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _209 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[15].y, _195);
    float _211 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[15].w, _199);
    float _213 = -_201;
    float _215 = _171 + _213;
    float _217 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[34].z, _197);
    float _219 = _203 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _221 = _209 * _177;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _211 * _215;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = _93 * _113;
    float _231 = _217 * _219;
    float _233 = fma(_227, _223, _219);
    float _235 = _119 * _231;
    float _237 = _125 * _231;
    float _239 = _217 * _233;
    float _241 = _229 * _231;
    float _243 = precise::max(_235, _237);
    float _245 = _119 * _239;
    float _247 = _125 * _239;
    float _249 = _229 * _239;
    float _251 = precise::max(_241, _243);
    out.m_34.x = _245;
    out.m_34.y = _247;
    out.m_34.z = _249;
    out.m_34.w = _251;
    return out;
}

