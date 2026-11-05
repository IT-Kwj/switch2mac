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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _233 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_233, float2(0.0), isnan(_233))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_233, float2(0.0), isnan(_233))).x;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = _59 * _71;
    float _81 = _59 * _77;
    bool _85 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_85)
    {
        discard_fragment();
    }
    float _87 = fma(_65, _79, _81);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    if (_85)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    bool _91 = _89 != 0.0;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    bool _101 = !_99;
    if (!_101)
    {
        float _103 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _105 = fma(_89, _103, 1.0);
        float _107 = log2(_105);
        float _109 = _107 + (-1.0);
        float _111 = exp2(_109);
        float _113 = _111 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _117 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _119 = -_113;
        float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _123 = -_113;
        float _125 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _127 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _129 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _131 = -_113;
        float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _135 = -_113;
        float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _370 = float2(_115, _117);
        float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_370, float2(0.0), isnan(_370)), level(_109)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_370, float2(0.0), isnan(_370)), level(_109)).xyz;
        float _143 = _141.x;
        float _145 = _141.y;
        float _147 = _141.z;
        float2 _385 = float2(_121, _125);
        float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_385, float2(0.0), isnan(_385)), level(_109)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_385, float2(0.0), isnan(_385)), level(_109)).xyz;
        float _151 = _149.x;
        float _153 = _149.y;
        float _155 = _149.z;
        float2 _400 = float2(_127, _129);
        float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_400, float2(0.0), isnan(_400)), level(_109)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_400, float2(0.0), isnan(_400)), level(_109)).xyz;
        float _159 = _157.x;
        float _161 = _157.y;
        float _163 = _157.z;
        float2 _415 = float2(_133, _137);
        float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_415, float2(0.0), isnan(_415)), level(_109)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_415, float2(0.0), isnan(_415)), level(_109)).xyz;
        float _167 = _165.x;
        float _169 = _165.y;
        float _171 = _165.z;
        float _173 = 0.0 + _107;
        float _175 = precise::clamp(_173, 0.0, 1.0);
        float _177 = _143 + _151;
        float _179 = _145 + _153;
        float _181 = _147 + _155;
        float _183 = _177 + _159;
        float _185 = _179 + _161;
        float _187 = _181 + _163;
        float _189 = _183 + _167;
        float _191 = _185 + _169;
        float _193 = _187 + _171;
        float _195 = _189 * 0.25;
        float _197 = _191 * 0.25;
        float _199 = _193 * 0.25;
        out.m_38.x = _195;
        out.m_38.y = _197;
        out.m_38.z = _199;
        out.m_38.w = _175;
        return out;
    }
    discard_fragment();
    return out;
}

