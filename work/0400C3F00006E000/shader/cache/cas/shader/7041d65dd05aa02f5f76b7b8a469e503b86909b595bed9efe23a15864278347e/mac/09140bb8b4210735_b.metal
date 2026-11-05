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
    float2 _230 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_230, float2(0.0), isnan(_230))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_230, float2(0.0), isnan(_230))).x;
    bool _65 = _61 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _67 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    float _71 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _73 = _69;
    if (_65)
    {
        discard_fragment();
    }
    bool _75 = _69 != 0.0;
    bool _77 = isnan(_69);
    bool _79 = _75 || _77;
    bool _81 = isnan(0.0);
    bool _83 = _79 || _81;
    if (_83)
    {
        _71 = 1.0;
    }
    float _85 = _71;
    float _87 = _85;
    if (_83)
    {
        float _89 = -_85;
        float _91 = _89 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _87 = _91;
    }
    float _93 = _87;
    float _95 = _93;
    if (_83)
    {
        float _97 = fma(_69, _93, 1.0);
        _73 = _97;
    }
    float _99 = _73;
    if (_65)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _101 = _99;
    if (_83)
    {
        float _103 = log2(_99);
        _101 = _103;
    }
    float _105 = _101;
    float _107 = _105;
    if (_83)
    {
        float _109 = _105 + (-1.0);
        _95 = _109;
    }
    float _111 = _95;
    float _113 = _57;
    float _115 = _59;
    float _117 = _111;
    if (_83)
    {
        float2 _330 = float2(_57, _59);
        float3 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_330, float2(0.0), isnan(_330)), level(_111)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_330, float2(0.0), isnan(_330)), level(_111)).xyz;
        float _123 = _121.x;
        float _125 = _121.y;
        float _127 = _121.z;
        _113 = _123;
        _115 = _125;
        _117 = _127;
    }
    float _129 = _113;
    float _131 = _115;
    float _133 = _117;
    int _136 = 0;
    if (_83)
    {
        float _138 = 0.0 + _105;
        float _140 = precise::clamp(_138, 0.0, 1.0);
        _136 = as_type<int>(_140);
    }
    int _142 = _136;
    float _144 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _146 = precise::clamp(_144, 0.0, 1.0);
    float _148 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = _146;
    float _154 = _150;
    if (_83)
    {
        float _156 = precise::min(_146, _150);
        _152 = _156;
    }
    float _158 = _152;
    if (_83)
    {
        float _160 = -_129;
        float _162 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[13].x, _160);
        _154 = _162;
    }
    float _164 = _154;
    float _166 = 0.0;
    if (_83)
    {
        float _168 = -_131;
        float _170 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[13].y, _168);
        _166 = _170;
    }
    float _172 = _166;
    if (_83)
    {
        float _174 = -_133;
        float _176 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[13].z, _174);
        _107 = _176;
    }
    float _178 = _107;
    int _180 = 0;
    if (_83)
    {
        float _182 = fma(_158, _164, _129);
        _180 = as_type<int>(_182);
    }
    int _184 = _180;
    int _186 = 0;
    if (_83)
    {
        float _188 = fma(_158, _172, _131);
        _186 = as_type<int>(_188);
    }
    int _190 = _186;
    int _192 = 0;
    if (_83)
    {
        float _194 = fma(_158, _178, _133);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    if (_83)
    {
        out.m_34.x = as_type<float>(_184);
        out.m_34.y = as_type<float>(_190);
        out.m_34.z = as_type<float>(_196);
        out.m_34.w = as_type<float>(_142);
        return out;
    }
    discard_fragment();
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
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
    float2 _230 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_230, float2(0.0), isnan(_230))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_230, float2(0.0), isnan(_230))).x;
    bool _65 = _61 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _67 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    float _71 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _73 = _69;
    if (_65)
    {
        discard_fragment();
    }
    bool _75 = _69 != 0.0;
    bool _77 = isnan(_69);
    bool _79 = _75 || _77;
    bool _81 = isnan(0.0);
    bool _83 = _79 || _81;
    if (_83)
    {
        _71 = 1.0;
    }
    float _85 = _71;
    float _87 = _85;
    if (_83)
    {
        float _89 = -_85;
        float _91 = _89 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _87 = _91;
    }
    float _93 = _87;
    float _95 = _93;
    if (_83)
    {
        float _97 = fma(_69, _93, 1.0);
        _73 = _97;
    }
    float _99 = _73;
    if (_65)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    float _101 = _99;
    if (_83)
    {
        float _103 = log2(_99);
        _101 = _103;
    }
    float _105 = _101;
    float _107 = _105;
    if (_83)
    {
        float _109 = _105 + (-1.0);
        _95 = _109;
    }
    float _111 = _95;
    float _113 = _57;
    float _115 = _59;
    float _117 = _111;
    if (_83)
    {
        float2 _330 = float2(_57, _59);
        float3 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_330, float2(0.0), isnan(_330)), level(_111)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_330, float2(0.0), isnan(_330)), level(_111)).xyz;
        float _123 = _121.x;
        float _125 = _121.y;
        float _127 = _121.z;
        _113 = _123;
        _115 = _125;
        _117 = _127;
    }
    float _129 = _113;
    float _131 = _115;
    float _133 = _117;
    int _136 = 0;
    if (_83)
    {
        float _138 = 0.0 + _105;
        float _140 = precise::clamp(_138, 0.0, 1.0);
        _136 = as_type<int>(_140);
    }
    int _142 = _136;
    float _144 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _146 = precise::clamp(_144, 0.0, 1.0);
    float _148 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = _146;
    float _154 = _150;
    if (_83)
    {
        float _156 = precise::min(_146, _150);
        _152 = _156;
    }
    float _158 = _152;
    if (_83)
    {
        float _160 = -_129;
        float _162 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[13].x, _160);
        _154 = _162;
    }
    float _164 = _154;
    float _166 = 0.0;
    if (_83)
    {
        float _168 = -_131;
        float _170 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[13].y, _168);
        _166 = _170;
    }
    float _172 = _166;
    if (_83)
    {
        float _174 = -_133;
        float _176 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[13].z, _174);
        _107 = _176;
    }
    float _178 = _107;
    int _180 = 0;
    if (_83)
    {
        float _182 = fma(_158, _164, _129);
        _180 = as_type<int>(_182);
    }
    int _184 = _180;
    int _186 = 0;
    if (_83)
    {
        float _188 = fma(_158, _172, _131);
        _186 = as_type<int>(_188);
    }
    int _190 = _186;
    int _192 = 0;
    if (_83)
    {
        float _194 = fma(_158, _178, _133);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    if (_83)
    {
        out.m_34.x = as_type<float>(_184);
        out.m_34.y = as_type<float>(_190);
        out.m_34.z = as_type<float>(_196);
        out.m_34.w = as_type<float>(_142);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_34)};
}

