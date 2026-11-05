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
    float2 _189 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_189, float2(0.0), isnan(_189))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_189, float2(0.0), isnan(_189))).x;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _65 = precise::clamp(_63, 0.0, 1.0);
    float _67 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    float _71 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _73 = precise::clamp(_71, 0.0, 1.0);
    bool _77 = _65 != 0.0;
    bool _79 = isnan(_65);
    bool _81 = _77 || _79;
    bool _83 = isnan(0.0);
    bool _85 = _81 || _83;
    bool _87 = !_85;
    if (!_87)
    {
        float _89 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _91 = fma(_65, _89, 1.0);
        float _93 = log2(_91);
        float _95 = _93 + (-1.0);
        float2 _256 = float2(_57, _59);
        float3 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_256, float2(0.0), isnan(_256)), level(_95)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_256, float2(0.0), isnan(_256)), level(_95)).xyz;
        float _101 = _99.x;
        float _103 = _99.y;
        float _105 = _99.z;
        float _107 = precise::min(_69, _73);
        float _109 = 0.0 + _93;
        float _111 = precise::clamp(_109, 0.0, 1.0);
        float _113 = _107 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _115 = _103 * 0.586600005626678466796875;
        float _117 = fma(_101, 0.29890000820159912109375, _115);
        float _119 = fma(_105, 0.1143999993801116943359375, _117);
        float _121 = -_101;
        float _123 = _121 + _119;
        float _125 = -_103;
        float _127 = _125 + _119;
        float _129 = -_105;
        float _131 = _129 + _119;
        float _133 = fma(_113, _123, _101);
        float _135 = fma(_113, _127, _103);
        float _137 = fma(_113, _131, _105);
        float _139 = -_133;
        float _141 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[13].x, _139);
        float _143 = -_135;
        float _145 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[13].y, _143);
        float _147 = -_137;
        float _149 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[13].z, _147);
        float _151 = fma(_107, _141, _133);
        float _153 = fma(_107, _145, _135);
        float _155 = fma(_107, _149, _137);
        out.m_34.x = _151;
        out.m_34.y = _153;
        out.m_34.z = _155;
        out.m_34.w = _111;
        return out;
    }
    discard_fragment();
    return out;
}

