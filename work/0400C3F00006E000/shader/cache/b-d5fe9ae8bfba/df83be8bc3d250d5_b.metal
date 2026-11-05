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
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _232 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_232, float2(0.0), isnan(_232))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_232, float2(0.0), isnan(_232))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _57 * _69;
    float _79 = _57 * _75;
    float _81 = -_63;
    float _83 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _85 = 1.0 / _83;
    float _87 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    float _91 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    float _95 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _97 = precise::clamp(_95, 0.0, 1.0);
    bool _101 = _89 != 0.0;
    bool _103 = isnan(_89);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.0);
    bool _109 = _105 || _107;
    bool _111 = !_109;
    if (!_111)
    {
        float2 _319 = float2(_77, _79);
        float2 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_319, float2(0.0), isnan(_319))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_319, float2(0.0), isnan(_319))).xy;
        float _117 = _115.x;
        float _119 = _115.y;
        float _121 = (*spvDescriptorSet0.fp_c3)._m0[0].y + (-1.0);
        float _123 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _125 = fma(_89, _121, 1.0);
        float _127 = log2(_125);
        float _129 = _117 + (-0.5);
        float _131 = _119 + (-0.5);
        float _133 = _129 * _123;
        float _135 = _131 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
        float _137 = fma(_89, _133, _59);
        float _139 = precise::clamp(_137, 0.0, 1.0);
        float _141 = fma(_89, _135, _61);
        float _143 = precise::clamp(_141, 0.0, 1.0);
        float2 _369 = float2(_139, _143);
        float3 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_369, float2(0.0), isnan(_369)), bias(_127)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_369, float2(0.0), isnan(_369)), bias(_127)).xyz;
        float _149 = _147.x;
        float _151 = _147.y;
        float _153 = _147.z;
        float _155 = precise::min(_93, _97);
        float _157 = _155 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _159 = _151 * 0.586600005626678466796875;
        float _161 = fma(_149, 0.29890000820159912109375, _159);
        float _163 = fma(_153, 0.1143999993801116943359375, _161);
        float _165 = -_149;
        float _167 = _165 + _163;
        float _169 = -_151;
        float _171 = _169 + _163;
        float _173 = -_153;
        float _175 = _173 + _163;
        float _177 = fma(_157, _167, _149);
        float _179 = fma(_157, _171, _151);
        float _181 = fma(_157, _175, _153);
        float _183 = -_177;
        float _185 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[13].x, _183);
        float _187 = -_179;
        float _189 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[13].y, _187);
        float _191 = -_181;
        float _193 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[13].z, _191);
        float _195 = fma(_155, _185, _177);
        float _197 = fma(_155, _189, _179);
        float _199 = fma(_155, _193, _181);
        out.m_36.x = _195;
        out.m_36.y = _197;
        out.m_36.z = _199;
        out.m_36.w = 1.0;
        return out;
    }
    discard_fragment();
    return out;
}

