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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
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
    float2 _307 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_307, float2(0.0), isnan(_307))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_307, float2(0.0), isnan(_307))).x;
    float2 _318 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_318, float2(0.0), isnan(_318))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_318, float2(0.0), isnan(_318))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _59 * _73;
    float _89 = _59 * _79;
    float _91 = _59 * _85;
    float _93 = -_65;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _97 = 1.0 / _95;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _101 = precise::clamp(_99, 0.0, 1.0);
    float _103 = precise::max(_67, _101);
    float _105 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = precise::max(_103, _91);
    bool _113 = _109 != 0.0;
    bool _115 = isnan(_109);
    bool _117 = _113 || _115;
    bool _119 = isnan(0.0);
    bool _121 = _117 || _119;
    float _123 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = precise::min(_125, _107);
    bool _129 = !_121;
    if (!_129)
    {
        float _131 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _133 = fma(_109, _131, 1.0);
        float _135 = log2(_133);
        float _137 = _135 + (-1.0);
        float _139 = exp2(_137);
        float _141 = _139 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _145 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _147 = -_141;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _151 = -_141;
        float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _155 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _157 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _159 = -_141;
        float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _480 = float2(_143, _145);
        float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_480, float2(0.0), isnan(_480)), level(_137)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_480, float2(0.0), isnan(_480)), level(_137)).xyz;
        float _167 = _165.x;
        float _169 = _165.y;
        float _171 = _165.z;
        float _173 = -_141;
        float _175 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float2 _502 = float2(_149, _153);
        float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_502, float2(0.0), isnan(_502)), level(_137)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_502, float2(0.0), isnan(_502)), level(_137)).xyz;
        float _179 = _177.x;
        float _181 = _177.y;
        float _183 = _177.z;
        float2 _517 = float2(_155, _157);
        float3 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_517, float2(0.0), isnan(_517)), level(_137)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_517, float2(0.0), isnan(_517)), level(_137)).xyz;
        float _187 = _185.x;
        float _189 = _185.y;
        float _191 = _185.z;
        float2 _532 = float2(_175, _161);
        float3 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_532, float2(0.0), isnan(_532)), level(_137)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_532, float2(0.0), isnan(_532)), level(_137)).xyz;
        float _195 = _193.x;
        float _197 = _193.y;
        float _199 = _193.z;
        float _201 = 0.0 + _135;
        float _203 = precise::clamp(_201, 0.0, 1.0);
        float _205 = fma(_89, _203, _87);
        float _207 = _169 + _181;
        float _209 = _167 + _179;
        float _211 = _171 + _183;
        float _213 = _207 + _189;
        float _215 = _209 + _187;
        float _217 = _211 + _191;
        float _219 = _213 + _197;
        float _221 = _215 + _195;
        float _223 = _217 + _199;
        float _225 = _219 * 0.14665000140666961669921875;
        float _227 = _221 * 0.25;
        float _229 = _219 * 0.25;
        float _231 = fma(_221, 0.0747250020503997802734375, _225);
        float _233 = _127 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _235 = fma(_223, 0.028599999845027923583984375, _231);
        float _237 = _223 * 0.25;
        float _239 = -_227;
        float _241 = _239 + _235;
        float _243 = -_229;
        float _245 = _243 + _235;
        float _247 = -_237;
        float _249 = _247 + _235;
        float _251 = fma(_233, _241, _227);
        float _253 = fma(_233, _245, _229);
        float _255 = fma(_233, _249, _237);
        float _257 = -_251;
        float _259 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[13].x, _257);
        float _261 = -_253;
        float _263 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[13].y, _261);
        float _265 = -_255;
        float _267 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[13].z, _265);
        float _269 = fma(_127, _259, _251);
        float _271 = fma(_127, _263, _253);
        float _273 = fma(_127, _267, _255);
        out.m_38.x = _269;
        out.m_38.y = _271;
        out.m_38.z = _273;
        out.m_38.w = _205;
        return out;
    }
    discard_fragment();
    return out;
}

