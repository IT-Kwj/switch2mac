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
    float2 _315 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_315, float2(0.0), isnan(_315))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_315, float2(0.0), isnan(_315))).x;
    float2 _326 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_326, float2(0.0), isnan(_326))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_326, float2(0.0), isnan(_326))).x;
    float _69 = in.m_35.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _59 * _73;
    float _89 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = precise::max(_67, _91);
    float _99 = precise::max(_97, _87);
    bool _103 = _99 != 0.0;
    bool _105 = isnan(_99);
    bool _107 = _103 || _105;
    bool _109 = isnan(0.0);
    bool _111 = _107 || _109;
    float _113 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _59 * _79;
    float _119 = _59 * _85;
    float _121 = precise::min(_115, _95);
    bool _123 = !_111;
    if (!_123)
    {
        float _125 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _127 = fma(_99, _125, 1.0);
        float _129 = log2(_127);
        float _131 = _129 + (-1.0);
        float _133 = exp2(_131);
        float _135 = _133 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _139 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _141 = -_135;
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _145 = -_135;
        float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _149 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _151 = -_135;
        float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _155 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _157 = -_135;
        float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _484 = float2(_137, _139);
        float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_484, float2(0.0), isnan(_484)), level(_131)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_484, float2(0.0), isnan(_484)), level(_131)).xyz;
        float _165 = _163.x;
        float _167 = _163.y;
        float _169 = _163.z;
        float2 _499 = float2(_143, _147);
        float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_499, float2(0.0), isnan(_499)), level(_131)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_499, float2(0.0), isnan(_499)), level(_131)).xyz;
        float _173 = _171.x;
        float _175 = _171.y;
        float _177 = _171.z;
        float2 _514 = float2(_149, _155);
        float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_514, float2(0.0), isnan(_514)), level(_131)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_514, float2(0.0), isnan(_514)), level(_131)).xyz;
        float _181 = _179.x;
        float _183 = _179.y;
        float _185 = _179.z;
        float2 _529 = float2(_153, _159);
        float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_529, float2(0.0), isnan(_529)), level(_131)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_529, float2(0.0), isnan(_529)), level(_131)).xyz;
        float _189 = _187.x;
        float _191 = _187.y;
        float _193 = _187.z;
        float _195 = _167 + _175;
        float _197 = _165 + _173;
        float _199 = _169 + _177;
        float _201 = _121 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _203 = _195 + _183;
        float _205 = _197 + _181;
        float _207 = _199 + _185;
        float _209 = 0.0 + _129;
        float _211 = precise::clamp(_209, 0.0, 1.0);
        float _213 = _203 + _191;
        float _215 = _205 + _189;
        float _217 = _207 + _193;
        float _219 = fma(_119, _211, _117);
        float _221 = _213 * 0.14665000140666961669921875;
        float _223 = _215 * 0.25;
        float _225 = _217 * 0.25;
        float _227 = _211 * _119;
        float _229 = fma(_215, 0.0747250020503997802734375, _221);
        float _231 = 1.0 / _219;
        float _233 = _213 * 0.25;
        float _235 = fma(_217, 0.028599999845027923583984375, _229);
        float _237 = -_225;
        float _239 = _237 + _235;
        float _241 = -_223;
        float _243 = _241 + _235;
        float _245 = -_233;
        float _247 = _245 + _235;
        float _249 = fma(_201, _239, _225);
        float _251 = fma(_201, _243, _223);
        float _253 = fma(_201, _247, _233);
        float _255 = -_249;
        float _257 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[13].z, _255);
        float _259 = -_251;
        float _261 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[13].x, _259);
        float _263 = -_253;
        float _265 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[13].y, _263);
        float _267 = fma(_121, _257, _249);
        float _269 = fma(_121, _261, _251);
        float _271 = _231 * _227;
        float _273 = fma(_121, _265, _253);
        float _275 = _267 * _227;
        float _277 = _269 * _271;
        float _279 = _273 * _271;
        float _281 = _275 * _231;
        out.m_38.x = _277;
        out.m_38.y = _279;
        out.m_38.z = _281;
        out.m_38.w = _219;
        return out;
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _117;
    return out;
}

