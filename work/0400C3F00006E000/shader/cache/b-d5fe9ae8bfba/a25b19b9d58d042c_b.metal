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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_CSmplr_w [[id(5)]];
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
    float2 _207 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_207, float2(0.0), isnan(_207))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_207, float2(0.0), isnan(_207))).x;
    bool _65 = _61 != 0.0;
    bool _67 = isnan(_61);
    bool _69 = _65 || _67;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    bool _75 = !_73;
    if (!_75)
    {
        float _77 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _79 = fma(_61, _77, 1.0);
        float _81 = log2(_79);
        float _83 = _81 + (-1.0);
        float _85 = exp2(_83);
        float _87 = _85 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _89 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _91 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _93 = -_87;
        float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _97 = -_87;
        float _99 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _101 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float _103 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float _105 = -_87;
        float _107 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float2 _296 = float2(_89, _91);
        float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_296, float2(0.0), isnan(_296)), level(_83)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_296, float2(0.0), isnan(_296)), level(_83)).xyz;
        float _113 = _111.x;
        float _115 = _111.y;
        float _117 = _111.z;
        float _119 = -_87;
        float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float2 _318 = float2(_95, _99);
        float3 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_318, float2(0.0), isnan(_318)), level(_83)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_318, float2(0.0), isnan(_318)), level(_83)).xyz;
        float _125 = _123.x;
        float _127 = _123.y;
        float _129 = _123.z;
        float2 _333 = float2(_101, _103);
        float3 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_333, float2(0.0), isnan(_333)), level(_83)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_333, float2(0.0), isnan(_333)), level(_83)).xyz;
        float _133 = _131.x;
        float _135 = _131.y;
        float _137 = _131.z;
        float2 _348 = float2(_107, _121);
        float3 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_348, float2(0.0), isnan(_348)), level(_83)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_348, float2(0.0), isnan(_348)), level(_83)).xyz;
        float _141 = _139.x;
        float _143 = _139.y;
        float _145 = _139.z;
        float _147 = 0.0 + _81;
        float _149 = precise::clamp(_147, 0.0, 1.0);
        float _151 = _113 + _125;
        float _153 = _115 + _127;
        float _155 = _117 + _129;
        float _157 = _151 + _133;
        float _159 = _153 + _135;
        float _161 = _155 + _137;
        float _163 = _157 + _141;
        float _165 = _159 + _143;
        float _167 = _161 + _145;
        float _169 = _163 * 0.25;
        float _171 = _165 * 0.25;
        float _173 = _167 * 0.25;
        out.m_34.x = _169;
        out.m_34.y = _171;
        out.m_34.z = _173;
        out.m_34.w = _149;
        return out;
    }
    discard_fragment();
    return out;
}

