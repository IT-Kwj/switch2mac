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
    float2 _191 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_191, float2(0.0), isnan(_191))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_191, float2(0.0), isnan(_191))).x;
    bool _65 = _61 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_65)
    {
        discard_fragment();
    }
    if (_65)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _67 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    float _71 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _73 = precise::clamp(_71, 0.0, 1.0);
    float _75 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _77 = precise::clamp(_75, 0.0, 1.0);
    bool _79 = _69 != 0.0;
    bool _81 = isnan(_69);
    bool _83 = _79 || _81;
    bool _85 = isnan(0.0);
    bool _87 = _83 || _85;
    bool _89 = !_87;
    if (!_89)
    {
        float _91 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _93 = fma(_69, _91, 1.0);
        float _95 = log2(_93);
        float _97 = _95 + (-1.0);
        float2 _273 = float2(_57, _59);
        float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_273, float2(0.0), isnan(_273)), level(_97)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_273, float2(0.0), isnan(_273)), level(_97)).xyz;
        float _103 = _101.x;
        float _105 = _101.y;
        float _107 = _101.z;
        float _109 = precise::min(_73, _77);
        float _111 = 0.0 + _95;
        float _113 = precise::clamp(_111, 0.0, 1.0);
        float _115 = _109 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _117 = _105 * 0.586600005626678466796875;
        float _119 = fma(_103, 0.29890000820159912109375, _117);
        float _121 = fma(_107, 0.1143999993801116943359375, _119);
        float _123 = -_103;
        float _125 = _123 + _121;
        float _127 = -_105;
        float _129 = _127 + _121;
        float _131 = -_107;
        float _133 = _131 + _121;
        float _135 = fma(_115, _125, _103);
        float _137 = fma(_115, _129, _105);
        float _139 = fma(_115, _133, _107);
        float _141 = -_135;
        float _143 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[13].x, _141);
        float _145 = -_137;
        float _147 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[13].y, _145);
        float _149 = -_139;
        float _151 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[13].z, _149);
        float _153 = fma(_109, _143, _135);
        float _155 = fma(_109, _147, _137);
        float _157 = fma(_109, _151, _139);
        out.m_34.x = _153;
        out.m_34.y = _155;
        out.m_34.z = _157;
        out.m_34.w = _113;
        return out;
    }
    discard_fragment();
    return out;
}

