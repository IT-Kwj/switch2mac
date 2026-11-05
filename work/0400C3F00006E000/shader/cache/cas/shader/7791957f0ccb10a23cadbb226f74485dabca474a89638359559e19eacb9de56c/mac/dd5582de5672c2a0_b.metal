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
    float2 _295 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_295, float2(0.0), isnan(_295))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_295, float2(0.0), isnan(_295))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _312 = float2(_57, _59);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_312, float2(0.0), isnan(_312))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_312, float2(0.0), isnan(_312))).x;
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
    float _105 = _103 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = _101 * _109;
    float _117 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = _91 * _109;
    float _123 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _125 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _127 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _129 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _131 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[11].x, _123);
    float _137 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[11].y, _125);
    float _139 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[11].z, _127);
    float _141 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[11].w, _129);
    float _143 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[12].x, _135);
    float _145 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[12].y, _137);
    float _147 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[12].z, _139);
    float _149 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[12].w, _141);
    float _151 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _85 * _109;
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].x, _143);
    float _159 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].y, _145);
    float _161 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].z, _147);
    float _163 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].w, _149);
    float _165 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = 1.0 / _115;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _173 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[0].w, _171);
    float _175 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[14].x, _157);
    float _177 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[14].z, _161);
    float _183 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[14].w, _163);
    float _185 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[14].y, _159);
    float _187 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[15].x, _175);
    float _189 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[15].z, _181);
    float _191 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[15].y, _185);
    float _193 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[15].w, _183);
    float _195 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[27].x, (*spvDescriptorSet0.fp_c3)._m0[27].y);
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = -_187;
    float _201 = _115 + _199;
    float _203 = _189;
    if (!_83)
    {
        float _205 = _189 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _203 = _205;
    }
    float _207 = _203;
    float _209 = _191 * _169;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _215 = _213 + (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _217 = _197 * _197;
    float _219 = _193 * _201;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = _207 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _225 = _93 * _109;
    float _227 = fma(_217, _215, (*spvDescriptorSet0.fp_c3)._m0[28].x);
    float _229 = _221 * _211;
    float _231 = -_223;
    float _233 = _231 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _235 = _229 * _227;
    float _237 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[34].z, _223);
    float _239 = -_229;
    float _241 = _239 + _235;
    float _243 = _237 * _235;
    float _245 = _237 * _241;
    float _247 = _121 * _245;
    float _249 = _155 * _245;
    float _251 = _225 * _245;
    float _253 = _121 * _243;
    float _255 = _155 * _243;
    float _257 = _225 * _243;
    float _259 = precise::max(_247, _249);
    float _261 = precise::max(_251, _259);
    out.m_34.x = _253;
    out.m_34.y = _255;
    out.m_34.z = _257;
    out.m_34.w = _261;
    return out;
}

