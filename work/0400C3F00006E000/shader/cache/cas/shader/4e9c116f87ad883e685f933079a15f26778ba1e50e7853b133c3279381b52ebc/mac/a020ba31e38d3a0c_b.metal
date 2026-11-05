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
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _65 = precise::clamp(_63, 0.0, 1.0);
    float _67 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    float _71 = precise::max(_65, _69);
    bool _75 = _71 != 0.0;
    bool _77 = isnan(_71);
    bool _79 = _75 || _77;
    bool _81 = isnan(0.0);
    bool _83 = _79 || _81;
    float _85 = _69;
    float _87 = _71;
    if (_83)
    {
        _85 = 1.0;
    }
    float _89 = _85;
    float _91 = _89;
    if (_83)
    {
        float _93 = -_89;
        float _95 = _93 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _91 = _95;
    }
    float _97 = _91;
    float _99 = _97;
    if (_83)
    {
        float _101 = fma(_71, _97, 1.0);
        _87 = _101;
    }
    float _103 = _87;
    float _105 = _103;
    if (_83)
    {
        float _107 = log2(_103);
        _105 = _107;
    }
    float _109 = _105;
    if (_83)
    {
        float _111 = _109 + (-1.0);
        _99 = _111;
    }
    float _113 = _99;
    float _115 = _57;
    float _117 = _59;
    float _119 = 0.0;
    if (_83)
    {
        float2 _322 = float2(_57, _59);
        float3 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_322, float2(0.0), isnan(_322)), level(_113)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_322, float2(0.0), isnan(_322)), level(_113)).xyz;
        float _125 = _123.x;
        float _127 = _123.y;
        float _129 = _123.z;
        _115 = _125;
        _117 = _127;
        _119 = _129;
    }
    float _131 = _115;
    float _133 = _117;
    float _135 = _119;
    int _138 = 0;
    if (_83)
    {
        float _140 = 0.0 + _109;
        float _142 = precise::clamp(_140, 0.0, 1.0);
        _138 = as_type<int>(_142);
    }
    int _144 = _138;
    float _146 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = precise::min(_148, _152);
    float _156 = _152;
    float _158 = (*spvDescriptorSet0.fp_c3)._m0[4].w;
    if (_83)
    {
        float _160 = -_131;
        float _162 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[13].x, _160);
        _156 = _162;
    }
    float _164 = _156;
    float _166 = 0.0;
    if (_83)
    {
        float _168 = -_133;
        float _170 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[13].y, _168);
        _166 = _170;
    }
    float _172 = _166;
    if (_83)
    {
        float _174 = -_135;
        float _176 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[13].z, _174);
        _158 = _176;
    }
    float _178 = _158;
    int _180 = 0;
    if (_83)
    {
        float _182 = fma(_154, _164, _131);
        _180 = as_type<int>(_182);
    }
    int _184 = _180;
    int _186 = 0;
    if (_83)
    {
        float _188 = fma(_154, _172, _133);
        _186 = as_type<int>(_188);
    }
    int _190 = _186;
    int _192 = 0;
    if (_83)
    {
        float _194 = fma(_154, _178, _135);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    if (_83)
    {
        out.m_34.x = as_type<float>(_184);
        out.m_34.y = as_type<float>(_190);
        out.m_34.z = as_type<float>(_196);
        out.m_34.w = as_type<float>(_144);
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
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _65 = precise::clamp(_63, 0.0, 1.0);
    float _67 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    float _71 = precise::max(_65, _69);
    bool _75 = _71 != 0.0;
    bool _77 = isnan(_71);
    bool _79 = _75 || _77;
    bool _81 = isnan(0.0);
    bool _83 = _79 || _81;
    float _85 = _69;
    float _87 = _71;
    if (_83)
    {
        _85 = 1.0;
    }
    float _89 = _85;
    float _91 = _89;
    if (_83)
    {
        float _93 = -_89;
        float _95 = _93 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _91 = _95;
    }
    float _97 = _91;
    float _99 = _97;
    if (_83)
    {
        float _101 = fma(_71, _97, 1.0);
        _87 = _101;
    }
    float _103 = _87;
    float _105 = _103;
    if (_83)
    {
        float _107 = log2(_103);
        _105 = _107;
    }
    float _109 = _105;
    if (_83)
    {
        float _111 = _109 + (-1.0);
        _99 = _111;
    }
    float _113 = _99;
    float _115 = _57;
    float _117 = _59;
    float _119 = 0.0;
    if (_83)
    {
        float2 _322 = float2(_57, _59);
        float3 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_322, float2(0.0), isnan(_322)), level(_113)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_322, float2(0.0), isnan(_322)), level(_113)).xyz;
        float _125 = _123.x;
        float _127 = _123.y;
        float _129 = _123.z;
        _115 = _125;
        _117 = _127;
        _119 = _129;
    }
    float _131 = _115;
    float _133 = _117;
    float _135 = _119;
    int _138 = 0;
    if (_83)
    {
        float _140 = 0.0 + _109;
        float _142 = precise::clamp(_140, 0.0, 1.0);
        _138 = as_type<int>(_142);
    }
    int _144 = _138;
    float _146 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = precise::min(_148, _152);
    float _156 = _152;
    float _158 = (*spvDescriptorSet0.fp_c3)._m0[4].w;
    if (_83)
    {
        float _160 = -_131;
        float _162 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[13].x, _160);
        _156 = _162;
    }
    float _164 = _156;
    float _166 = 0.0;
    if (_83)
    {
        float _168 = -_133;
        float _170 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[13].y, _168);
        _166 = _170;
    }
    float _172 = _166;
    if (_83)
    {
        float _174 = -_135;
        float _176 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[13].z, _174);
        _158 = _176;
    }
    float _178 = _158;
    int _180 = 0;
    if (_83)
    {
        float _182 = fma(_154, _164, _131);
        _180 = as_type<int>(_182);
    }
    int _184 = _180;
    int _186 = 0;
    if (_83)
    {
        float _188 = fma(_154, _172, _133);
        _186 = as_type<int>(_188);
    }
    int _190 = _186;
    int _192 = 0;
    if (_83)
    {
        float _194 = fma(_154, _178, _135);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    if (_83)
    {
        out.m_34.x = as_type<float>(_184);
        out.m_34.y = as_type<float>(_190);
        out.m_34.z = as_type<float>(_196);
        out.m_34.w = as_type<float>(_144);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_34)};
}

