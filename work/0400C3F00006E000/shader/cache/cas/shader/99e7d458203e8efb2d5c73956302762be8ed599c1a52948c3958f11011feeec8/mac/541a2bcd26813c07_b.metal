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
    float2 _263 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_263, float2(0.0), isnan(_263))).x;
    float2 _274 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_274, float2(0.0), isnan(_274))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_274, float2(0.0), isnan(_274))).x;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _59 * _73;
    float _89 = _59 * _79;
    float _91 = _59 * _85;
    float _93 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = precise::max(_67, _95);
    float _99 = precise::max(_97, _89);
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
        float _127 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _129 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _131 = -_125;
        float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _135 = -_125;
        float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _139 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _141 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _143 = -_125;
        float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float2 _406 = float2(_127, _129);
        float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_406, float2(0.0), isnan(_406)), level(_121)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_406, float2(0.0), isnan(_406)), level(_121)).xyz;
        float _151 = _149.x;
        float _153 = _149.y;
        float _155 = _149.z;
        float _157 = -_125;
        float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _428 = float2(_133, _137);
        float3 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_428, float2(0.0), isnan(_428)), level(_121)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_428, float2(0.0), isnan(_428)), level(_121)).xyz;
        float _163 = _161.x;
        float _165 = _161.y;
        float _167 = _161.z;
        float2 _443 = float2(_139, _141);
        float3 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_443, float2(0.0), isnan(_443)), level(_121)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_443, float2(0.0), isnan(_443)), level(_121)).xyz;
        float _171 = _169.x;
        float _173 = _169.y;
        float _175 = _169.z;
        float2 _458 = float2(_145, _159);
        float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_458, float2(0.0), isnan(_458)), level(_121)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_458, float2(0.0), isnan(_458)), level(_121)).xyz;
        float _179 = _177.x;
        float _181 = _177.y;
        float _183 = _177.z;
        float _185 = 0.0 + _119;
        float _187 = precise::clamp(_185, 0.0, 1.0);
        float _189 = fma(_87, _187, _91);
        float _191 = 1.0 / _189;
        float _193 = _151 + _163;
        float _195 = _153 + _165;
        float _197 = _155 + _167;
        float _199 = _87 * _191;
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
        out.m_38.x = _225;
        out.m_38.y = _227;
        out.m_38.z = _229;
        out.m_38.w = _189;
        return out;
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _91;
    return out;
}

