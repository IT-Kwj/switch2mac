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
    float2 _197 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_197, float2(0.0), isnan(_197))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_197, float2(0.0), isnan(_197))).x;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    bool _71 = _67 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_71)
    {
        discard_fragment();
    }
    if (_71)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _73 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    bool _77 = _75 != 0.0;
    bool _79 = isnan(_75);
    bool _81 = _77 || _79;
    bool _83 = isnan(0.0);
    bool _85 = _81 || _83;
    float _87 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    float _91 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    bool _95 = !_85;
    if (!_95)
    {
        float _97 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _99 = fma(_75, _97, 1.0);
        float _101 = log2(_99);
        float _103 = _101 + (-1.0);
        float2 _290 = float2(_57, _59);
        float3 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_290, float2(0.0), isnan(_290)), level(_103)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_290, float2(0.0), isnan(_290)), level(_103)).xyz;
        float _109 = _107.x;
        float _111 = _107.y;
        float _113 = _107.z;
        float _115 = precise::min(_89, _93);
        float _117 = 0.0 + _101;
        float _119 = precise::clamp(_117, 0.0, 1.0);
        float _121 = _115 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _123 = _111 * 0.586600005626678466796875;
        float _125 = fma(_109, 0.29890000820159912109375, _123);
        float _127 = fma(_113, 0.1143999993801116943359375, _125);
        float _129 = -_109;
        float _131 = _129 + _127;
        float _133 = -_111;
        float _135 = _133 + _127;
        float _137 = -_113;
        float _139 = _137 + _127;
        float _141 = fma(_121, _131, _109);
        float _143 = fma(_121, _135, _111);
        float _145 = fma(_121, _139, _113);
        float _147 = -_141;
        float _149 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].x, _147);
        float _151 = -_143;
        float _153 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].y, _151);
        float _155 = -_145;
        float _157 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].z, _155);
        float _159 = fma(_115, _149, _141);
        float _161 = fma(_115, _153, _143);
        float _163 = fma(_115, _157, _145);
        out.m_34.x = _159;
        out.m_34.y = _161;
        out.m_34.z = _163;
        out.m_34.w = _119;
        return out;
    }
    discard_fragment();
    return out;
}

