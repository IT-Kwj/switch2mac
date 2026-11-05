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
    float2 _263 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_263, float2(0.0), isnan(_263))).x;
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
    float _99 = precise::max(_97, _87);
    bool _103 = _99 != 0.0;
    bool _105 = isnan(_99);
    bool _107 = _103 || _105;
    bool _109 = isnan(0.0);
    bool _111 = _107 || _109;
    bool _113 = !_111;
    if (!_113)
    {
        float _115 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _117 = fma(_99, _115, 1.0);
        float _119 = log2(_117);
        float _121 = _119 + (-1.0);
        float _123 = exp2(_121);
        float _125 = _123 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _127 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _129 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _131 = -_125;
        float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _135 = -_125;
        float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _139 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _141 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _143 = -_125;
        float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _406 = float2(_127, _129);
        float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_406, float2(0.0), isnan(_406)), level(_121)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_406, float2(0.0), isnan(_406)), level(_121)).xyz;
        float _151 = _149.x;
        float _153 = _149.y;
        float _155 = _149.z;
        float _157 = -_125;
        float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _428 = float2(_133, _137);
        float3 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_428, float2(0.0), isnan(_428)), level(_121)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_428, float2(0.0), isnan(_428)), level(_121)).xyz;
        float _163 = _161.x;
        float _165 = _161.y;
        float _167 = _161.z;
        float2 _443 = float2(_139, _141);
        float3 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_443, float2(0.0), isnan(_443)), level(_121)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_443, float2(0.0), isnan(_443)), level(_121)).xyz;
        float _171 = _169.x;
        float _173 = _169.y;
        float _175 = _169.z;
        float2 _458 = float2(_145, _159);
        float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_458, float2(0.0), isnan(_458)), level(_121)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_458, float2(0.0), isnan(_458)), level(_121)).xyz;
        float _179 = _177.x;
        float _181 = _177.y;
        float _183 = _177.z;
        float _185 = 0.0 + _119;
        float _187 = precise::clamp(_185, 0.0, 1.0);
        float _189 = fma(_85, _187, _83);
        float _191 = 1.0 / _189;
        float _193 = _151 + _163;
        float _195 = _153 + _165;
        float _197 = _155 + _167;
        float _199 = _85 * _191;
        float _201 = _193 + _171;
        float _203 = _195 + _173;
        float _205 = _197 + _175;
        float _207 = _201 + _179;
        float _209 = _203 + _181;
        float _211 = _205 + _183;
        float _213 = _187 * _207;
        float _215 = _213 * 0.25;
        float _217 = _187 * _209;
        float _219 = _217 * 0.25;
        float _221 = _187 * _211;
        float _223 = _221 * 0.25;
        float _225 = _215 * _199;
        float _227 = _219 * _199;
        float _229 = _223 * _199;
        out.m_36.x = _225;
        out.m_36.y = _227;
        out.m_36.z = _229;
        out.m_36.w = _189;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _83;
    return out;
}

