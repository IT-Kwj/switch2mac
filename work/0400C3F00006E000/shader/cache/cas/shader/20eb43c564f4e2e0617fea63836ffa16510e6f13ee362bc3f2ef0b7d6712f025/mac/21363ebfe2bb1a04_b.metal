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
    float2 _277 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_277, float2(0.0), isnan(_277))).x;
    bool _69 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_69)
    {
        discard_fragment();
    }
    float2 _297 = float2(_61, _63);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_297, float2(0.0), isnan(_297))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_297, float2(0.0), isnan(_297))).x;
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
    float _95 = precise::max(_71, _93);
    float _97 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = _59 * _77;
    float _103 = precise::max(_95, _101);
    bool _105 = _103 != 0.0;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    float _115 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _59 * _83;
    float _121 = _59 * _89;
    float _123 = precise::min(_117, _99);
    bool _125 = !_113;
    if (!_125)
    {
        float _127 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _129 = fma(_103, _127, 1.0);
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
        float _153 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _155 = -_137;
        float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float2 _454 = float2(_139, _141);
        float3 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_454, float2(0.0), isnan(_454)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_454, float2(0.0), isnan(_454)), level(_133)).xyz;
        float _163 = _161.x;
        float _165 = _161.y;
        float _167 = _161.z;
        float _169 = -_137;
        float _171 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _476 = float2(_145, _149);
        float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_476, float2(0.0), isnan(_476)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_476, float2(0.0), isnan(_476)), level(_133)).xyz;
        float _175 = _173.x;
        float _177 = _173.y;
        float _179 = _173.z;
        float2 _491 = float2(_151, _153);
        float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_491, float2(0.0), isnan(_491)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_491, float2(0.0), isnan(_491)), level(_133)).xyz;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float2 _506 = float2(_157, _171);
        float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_506, float2(0.0), isnan(_506)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_506, float2(0.0), isnan(_506)), level(_133)).xyz;
        float _191 = _189.x;
        float _193 = _189.y;
        float _195 = _189.z;
        float _197 = 0.0 + _131;
        float _199 = precise::clamp(_197, 0.0, 1.0);
        float _201 = fma(_121, _199, _119);
        float _203 = _163 + _175;
        float _205 = _165 + _177;
        float _207 = _167 + _179;
        float _209 = _203 + _183;
        float _211 = _205 + _185;
        float _213 = _207 + _187;
        float _215 = _209 + _191;
        float _217 = _211 + _193;
        float _219 = _213 + _195;
        float _221 = _215 * 0.25;
        float _223 = _217 * 0.25;
        float _225 = _219 * 0.25;
        float _227 = -_221;
        float _229 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[13].x, _227);
        float _231 = -_223;
        float _233 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[13].y, _231);
        float _235 = -_225;
        float _237 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[13].z, _235);
        float _239 = fma(_123, _229, _221);
        float _241 = fma(_123, _233, _223);
        float _243 = fma(_123, _237, _225);
        out.m_36.x = _239;
        out.m_36.y = _241;
        out.m_36.z = _243;
        out.m_36.w = _201;
        return out;
    }
    discard_fragment();
    return out;
}

