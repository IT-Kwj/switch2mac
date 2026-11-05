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
    float4 m_36 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _317 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_317, float2(0.0), isnan(_317))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_317, float2(0.0), isnan(_317))).x;
    float _65 = -_63;
    float _67 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _69 = 1.0 / _67;
    bool _73 = _69 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_73)
    {
        discard_fragment();
    }
    if (_73)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _75 = in.m_36.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_36.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_36.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = _57 * _79;
    float _103 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float _107 = _57 * _85;
    float _109 = precise::max(_95, _101);
    float _111 = _57 * _91;
    float _113 = precise::min(_99, _105);
    bool _115 = _109 != 0.0;
    bool _117 = isnan(_109);
    bool _119 = _115 || _117;
    bool _121 = isnan(0.0);
    bool _123 = _119 || _121;
    bool _125 = !_123;
    if (!_125)
    {
        float _127 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _129 = fma(_109, _127, 1.0);
        float _131 = log2(_129);
        float _133 = _131 + (-1.0);
        float _135 = exp2(_133);
        float _137 = _135 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _141 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _143 = -_137;
        float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _147 = -_137;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _151 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _153 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _155 = -_137;
        float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _159 = -_137;
        float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _501 = float2(_139, _141);
        float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_501, float2(0.0), isnan(_501)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_501, float2(0.0), isnan(_501)), level(_133)).xyz;
        float _167 = _165.x;
        float _169 = _165.y;
        float _171 = _165.z;
        float2 _516 = float2(_145, _149);
        float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_516, float2(0.0), isnan(_516)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_516, float2(0.0), isnan(_516)), level(_133)).xyz;
        float _175 = _173.x;
        float _177 = _173.y;
        float _179 = _173.z;
        float2 _531 = float2(_151, _153);
        float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_531, float2(0.0), isnan(_531)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_531, float2(0.0), isnan(_531)), level(_133)).xyz;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float2 _546 = float2(_161, _157);
        float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_546, float2(0.0), isnan(_546)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_546, float2(0.0), isnan(_546)), level(_133)).xyz;
        float _191 = _189.x;
        float _193 = _189.y;
        float _195 = _189.z;
        float _197 = _169 + _177;
        float _199 = _167 + _175;
        float _201 = _171 + _179;
        float _203 = 0.0 + _131;
        float _205 = precise::clamp(_203, 0.0, 1.0);
        float _207 = _197 + _185;
        float _209 = _199 + _183;
        float _211 = _201 + _187;
        float _213 = fma(_111, _205, _107);
        float _215 = _207 + _193;
        float _217 = _209 + _191;
        float _219 = _211 + _195;
        float _221 = _205 * _111;
        float _223 = _215 * 0.14665000140666961669921875;
        float _225 = 1.0 / _213;
        float _227 = _219 * 0.25;
        float _229 = _215 * 0.25;
        float _231 = fma(_217, 0.0747250020503997802734375, _223);
        float _233 = _113 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _235 = fma(_219, 0.028599999845027923583984375, _231);
        float _237 = _217 * 0.25;
        float _239 = -_227;
        float _241 = _239 + _235;
        float _243 = -_237;
        float _245 = _243 + _235;
        float _247 = -_229;
        float _249 = _247 + _235;
        float _251 = fma(_233, _241, _227);
        float _253 = fma(_233, _245, _237);
        float _255 = fma(_233, _249, _229);
        float _257 = -_251;
        float _259 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[13].z, _257);
        float _261 = -_253;
        float _263 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[13].x, _261);
        float _265 = -_255;
        float _267 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[13].y, _265);
        float _269 = fma(_113, _259, _251);
        float _271 = fma(_113, _263, _253);
        float _273 = _225 * _221;
        float _275 = fma(_113, _267, _255);
        float _277 = _269 * _221;
        float _279 = _271 * _273;
        float _281 = _275 * _273;
        float _283 = _277 * _225;
        out.m_34.x = _279;
        out.m_34.y = _281;
        out.m_34.z = _283;
        out.m_34.w = _213;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _107;
    return out;
}

