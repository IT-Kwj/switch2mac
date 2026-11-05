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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _317 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_317, float2(0.0), isnan(_317))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_317, float2(0.0), isnan(_317))).x;
    bool _69 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_69)
    {
        discard_fragment();
    }
    float2 _337 = float2(_61, _63);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_337, float2(0.0), isnan(_337))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_337, float2(0.0), isnan(_337))).x;
    if (_69)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _73 = in.m_38.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_38.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_38.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    float _95 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = precise::max(_71, _93);
    float _101 = _59 * _77;
    float _103 = _59 * _83;
    float _105 = precise::max(_99, _101);
    bool _107 = _105 != 0.0;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan(0.0);
    bool _115 = _111 || _113;
    float _117 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = _59 * _89;
    float _123 = precise::min(_119, _97);
    bool _125 = !_115;
    if (!_125)
    {
        float _127 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _129 = fma(_105, _127, 1.0);
        float _131 = log2(_129);
        float _133 = _131 + (-1.0);
        float _135 = exp2(_133);
        float _137 = _135 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _141 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _143 = -_137;
        float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _147 = -_137;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _151 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _153 = -_137;
        float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _157 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _159 = -_137;
        float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _501 = float2(_139, _141);
        float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_501, float2(0.0), isnan(_501)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_501, float2(0.0), isnan(_501)), level(_133)).xyz;
        float _167 = _165.x;
        float _169 = _165.y;
        float _171 = _165.z;
        float2 _516 = float2(_145, _149);
        float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_516, float2(0.0), isnan(_516)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_516, float2(0.0), isnan(_516)), level(_133)).xyz;
        float _175 = _173.x;
        float _177 = _173.y;
        float _179 = _173.z;
        float2 _531 = float2(_151, _157);
        float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_531, float2(0.0), isnan(_531)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_531, float2(0.0), isnan(_531)), level(_133)).xyz;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float2 _546 = float2(_155, _161);
        float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_546, float2(0.0), isnan(_546)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_546, float2(0.0), isnan(_546)), level(_133)).xyz;
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
        float _213 = fma(_121, _205, _103);
        float _215 = _207 + _193;
        float _217 = _209 + _191;
        float _219 = _211 + _195;
        float _221 = _205 * _121;
        float _223 = _215 * 0.14665000140666961669921875;
        float _225 = 1.0 / _213;
        float _227 = _219 * 0.25;
        float _229 = _215 * 0.25;
        float _231 = fma(_217, 0.0747250020503997802734375, _223);
        float _233 = _123 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
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
        float _269 = fma(_123, _259, _251);
        float _271 = fma(_123, _263, _253);
        float _273 = _225 * _221;
        float _275 = fma(_123, _267, _255);
        float _277 = _269 * _221;
        float _279 = _271 * _273;
        float _281 = _275 * _273;
        float _283 = _277 * _225;
        out.m_36.x = _279;
        out.m_36.y = _281;
        out.m_36.z = _283;
        out.m_36.w = _213;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _103;
    return out;
}

