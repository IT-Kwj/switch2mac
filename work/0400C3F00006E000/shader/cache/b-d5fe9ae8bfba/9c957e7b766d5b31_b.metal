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
    float2 _234 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_234, float2(0.0), isnan(_234))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_234, float2(0.0), isnan(_234))).x;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _71 = precise::clamp(_69, 0.0, 1.0);
    bool _75 = _71 != 0.0;
    bool _77 = isnan(_71);
    bool _79 = _75 || _77;
    bool _81 = isnan(0.0);
    bool _83 = _79 || _81;
    float _85 = 0.0;
    float _87 = _55;
    float _89 = _71;
    if (_83)
    {
        _85 = 1.0;
    }
    float _91 = _85;
    if (_83)
    {
        float _93 = -_91;
        float _95 = _93 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _87 = _95;
    }
    float _97 = _87;
    float _99 = _97;
    if (_83)
    {
        float _101 = fma(_71, _97, 1.0);
        _89 = _101;
    }
    float _103 = _89;
    float _105 = _103;
    if (_83)
    {
        float _107 = log2(_103);
        _105 = _107;
    }
    float _109 = _105;
    float _111 = _109;
    if (_83)
    {
        float _113 = _109 + (-1.0);
        _99 = _113;
    }
    float _115 = _99;
    float _117 = _57;
    float _119 = _59;
    float _121 = _115;
    if (_83)
    {
        float2 _327 = float2(_57, _59);
        float3 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_327, float2(0.0), isnan(_327)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_327, float2(0.0), isnan(_327)), level(_115)).xyz;
        float _127 = _125.x;
        float _129 = _125.y;
        float _131 = _125.z;
        _117 = _127;
        _119 = _129;
        _121 = _131;
    }
    float _133 = _117;
    float _135 = _119;
    float _137 = _121;
    int _140 = 0;
    float _142 = (*spvDescriptorSet0.fp_c3)._m0[4].z;
    if (_83)
    {
        float _144 = 0.0 + _109;
        float _146 = precise::clamp(_144, 0.0, 1.0);
        _140 = as_type<int>(_146);
    }
    int _148 = _140;
    float _150 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = _156;
    float _160 = _152;
    if (_83)
    {
        float _162 = precise::min(_152, _156);
        _158 = _162;
    }
    float _164 = _158;
    if (_83)
    {
        float _166 = -_133;
        float _168 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[13].x, _166);
        _160 = _168;
    }
    float _170 = _160;
    if (_83)
    {
        float _172 = -_135;
        float _174 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[13].y, _172);
        _142 = _174;
    }
    float _176 = _142;
    if (_83)
    {
        float _178 = -_137;
        float _180 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[13].z, _178);
        _111 = _180;
    }
    float _182 = _111;
    int _184 = 0;
    if (_83)
    {
        float _186 = fma(_164, _170, _133);
        _184 = as_type<int>(_186);
    }
    int _188 = _184;
    int _190 = 0;
    if (_83)
    {
        float _192 = fma(_164, _176, _135);
        _190 = as_type<int>(_192);
    }
    int _194 = _190;
    int _196 = 0;
    if (_83)
    {
        float _198 = fma(_164, _182, _137);
        _196 = as_type<int>(_198);
    }
    int _200 = _196;
    if (_83)
    {
        out.m_34.x = as_type<float>(_188);
        out.m_34.y = as_type<float>(_194);
        out.m_34.z = as_type<float>(_200);
        out.m_34.w = as_type<float>(_148);
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
    float2 _234 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_234, float2(0.0), isnan(_234))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_234, float2(0.0), isnan(_234))).x;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _71 = precise::clamp(_69, 0.0, 1.0);
    bool _75 = _71 != 0.0;
    bool _77 = isnan(_71);
    bool _79 = _75 || _77;
    bool _81 = isnan(0.0);
    bool _83 = _79 || _81;
    float _85 = 0.0;
    float _87 = _55;
    float _89 = _71;
    if (_83)
    {
        _85 = 1.0;
    }
    float _91 = _85;
    if (_83)
    {
        float _93 = -_91;
        float _95 = _93 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _87 = _95;
    }
    float _97 = _87;
    float _99 = _97;
    if (_83)
    {
        float _101 = fma(_71, _97, 1.0);
        _89 = _101;
    }
    float _103 = _89;
    float _105 = _103;
    if (_83)
    {
        float _107 = log2(_103);
        _105 = _107;
    }
    float _109 = _105;
    float _111 = _109;
    if (_83)
    {
        float _113 = _109 + (-1.0);
        _99 = _113;
    }
    float _115 = _99;
    float _117 = _57;
    float _119 = _59;
    float _121 = _115;
    if (_83)
    {
        float2 _327 = float2(_57, _59);
        float3 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_327, float2(0.0), isnan(_327)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_327, float2(0.0), isnan(_327)), level(_115)).xyz;
        float _127 = _125.x;
        float _129 = _125.y;
        float _131 = _125.z;
        _117 = _127;
        _119 = _129;
        _121 = _131;
    }
    float _133 = _117;
    float _135 = _119;
    float _137 = _121;
    int _140 = 0;
    float _142 = (*spvDescriptorSet0.fp_c3)._m0[4].z;
    if (_83)
    {
        float _144 = 0.0 + _109;
        float _146 = precise::clamp(_144, 0.0, 1.0);
        _140 = as_type<int>(_146);
    }
    int _148 = _140;
    float _150 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = _156;
    float _160 = _152;
    if (_83)
    {
        float _162 = precise::min(_152, _156);
        _158 = _162;
    }
    float _164 = _158;
    if (_83)
    {
        float _166 = -_133;
        float _168 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[13].x, _166);
        _160 = _168;
    }
    float _170 = _160;
    if (_83)
    {
        float _172 = -_135;
        float _174 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[13].y, _172);
        _142 = _174;
    }
    float _176 = _142;
    if (_83)
    {
        float _178 = -_137;
        float _180 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[13].z, _178);
        _111 = _180;
    }
    float _182 = _111;
    int _184 = 0;
    if (_83)
    {
        float _186 = fma(_164, _170, _133);
        _184 = as_type<int>(_186);
    }
    int _188 = _184;
    int _190 = 0;
    if (_83)
    {
        float _192 = fma(_164, _176, _135);
        _190 = as_type<int>(_192);
    }
    int _194 = _190;
    int _196 = 0;
    if (_83)
    {
        float _198 = fma(_164, _182, _137);
        _196 = as_type<int>(_198);
    }
    int _200 = _196;
    if (_83)
    {
        out.m_34.x = as_type<float>(_188);
        out.m_34.y = as_type<float>(_194);
        out.m_34.z = as_type<float>(_200);
        out.m_34.w = as_type<float>(_148);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_34)};
}

