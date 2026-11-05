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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
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
    float2 _307 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_307, float2(0.0), isnan(_307))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_307, float2(0.0), isnan(_307))).x;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = _57 * _81;
    float _89 = -_63;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _93 = 1.0 / _91;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _101 = precise::clamp(_99, 0.0, 1.0);
    float _103 = precise::max(_97, _101);
    float _105 = precise::max(_103, _87);
    bool _109 = _105 != 0.0;
    bool _111 = isnan(_105);
    bool _113 = _109 || _111;
    bool _115 = isnan(0.0);
    bool _117 = _113 || _115;
    float _119 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = precise::min(_121, _125);
    bool _129 = !_117;
    if (!_129)
    {
        float _131 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _133 = fma(_105, _131, 1.0);
        float _135 = log2(_133);
        float _137 = _135 + (-1.0);
        float _139 = exp2(_137);
        float _141 = _139 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _145 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _147 = -_141;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _151 = -_141;
        float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _155 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _157 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _159 = -_141;
        float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _480 = float2(_143, _145);
        float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_480, float2(0.0), isnan(_480)), level(_137)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_480, float2(0.0), isnan(_480)), level(_137)).xyz;
        float _167 = _165.x;
        float _169 = _165.y;
        float _171 = _165.z;
        float _173 = -_141;
        float _175 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _502 = float2(_149, _153);
        float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_502, float2(0.0), isnan(_502)), level(_137)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_502, float2(0.0), isnan(_502)), level(_137)).xyz;
        float _179 = _177.x;
        float _181 = _177.y;
        float _183 = _177.z;
        float2 _517 = float2(_155, _157);
        float3 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_517, float2(0.0), isnan(_517)), level(_137)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_517, float2(0.0), isnan(_517)), level(_137)).xyz;
        float _187 = _185.x;
        float _189 = _185.y;
        float _191 = _185.z;
        float2 _532 = float2(_161, _175);
        float3 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_532, float2(0.0), isnan(_532)), level(_137)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_532, float2(0.0), isnan(_532)), level(_137)).xyz;
        float _195 = _193.x;
        float _197 = _193.y;
        float _199 = _193.z;
        float _201 = 0.0 + _135;
        float _203 = precise::clamp(_201, 0.0, 1.0);
        float _205 = fma(_85, _203, _83);
        float _207 = _127 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _209 = _169 + _181;
        float _211 = _167 + _179;
        float _213 = _171 + _183;
        float _215 = _209 + _189;
        float _217 = _211 + _187;
        float _219 = _213 + _191;
        float _221 = _215 + _197;
        float _223 = _217 + _195;
        float _225 = _219 + _199;
        float _227 = _221 * 0.14665000140666961669921875;
        float _229 = _221 * 0.25;
        float _231 = _225 * 0.25;
        float _233 = fma(_223, 0.0747250020503997802734375, _227);
        float _235 = _223 * 0.25;
        float _237 = fma(_225, 0.028599999845027923583984375, _233);
        float _239 = -_235;
        float _241 = _239 + _237;
        float _243 = -_229;
        float _245 = _243 + _237;
        float _247 = -_231;
        float _249 = _247 + _237;
        float _251 = fma(_207, _241, _235);
        float _253 = fma(_207, _245, _229);
        float _255 = fma(_207, _249, _231);
        float _257 = -_251;
        float _259 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[13].x, _257);
        float _261 = -_253;
        float _263 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[13].y, _261);
        float _265 = -_255;
        float _267 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[13].z, _265);
        float _269 = fma(_127, _259, _251);
        float _271 = fma(_127, _263, _253);
        float _273 = fma(_127, _267, _255);
        out.m_36.x = _269;
        out.m_36.y = _271;
        out.m_36.z = _273;
        out.m_36.w = _205;
        return out;
    }
    discard_fragment();
    return out;
}

