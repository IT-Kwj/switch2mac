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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _238 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_238, float2(0.0), isnan(_238))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_238, float2(0.0), isnan(_238))).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    bool _71 = 0 != as_type<int>((*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _73 = 0.0;
    float _75 = _51;
    int _78 = as_type<int>(_57);
    float _80 = _55;
    if (!_71)
    {
        float _82 = abs(_63);
        float _84 = log2(_82);
        _73 = _84;
    }
    float _86 = _73;
    if (_71)
    {
        _75 = _63;
    }
    float _88 = _75;
    float _90 = _88;
    if (_71)
    {
        _78 = as_type<int>(_67);
    }
    int _92 = _78;
    float _94 = 0.0;
    if (!_71)
    {
        float _96 = abs(_65);
        float _98 = log2(_96);
        _94 = _98;
    }
    float _100 = _94;
    float _102 = 0.0;
    if (!_71)
    {
        float _104 = abs(_67);
        float _106 = log2(_104);
        _102 = _106;
    }
    float _108 = _102;
    float _110 = 0.0;
    float _112 = _86;
    if (!_71)
    {
        float _114 = _86 * 2.2000000476837158203125;
        _110 = _114;
    }
    float _116 = _110;
    if (_71)
    {
        _112 = _65;
    }
    float _118 = _112;
    float _120 = _100;
    if (!_71)
    {
        float _122 = _100 * 2.2000000476837158203125;
        _120 = _122;
    }
    float _124 = _120;
    if (!_71)
    {
        float _126 = exp2(_116);
        _90 = _126;
    }
    float _128 = _90;
    if (!_71)
    {
        float _130 = _108 * 2.2000000476837158203125;
        _80 = _130;
    }
    float _132 = _80;
    float _134 = _118;
    int _136 = as_type<int>(_132);
    if (!_71)
    {
        float _138 = exp2(_124);
        _134 = _138;
    }
    float _140 = _134;
    int _142 = _92;
    if (!_71)
    {
        float _144 = exp2(_132);
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    float _148 = _140 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _150 = _140 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _152 = _140 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _154 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[0].x, _148);
    float _156 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[1].x, _150);
    float _158 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[2].x, _152);
    float _160 = fma(as_type<float>(_146), (*spvDescriptorSet0.fp_c3)._m0[0].z, _154);
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = fma(as_type<float>(_146), (*spvDescriptorSet0.fp_c3)._m0[1].z, _156);
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = fma(as_type<float>(_146), (*spvDescriptorSet0.fp_c3)._m0[2].z, _158);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    int _172 = _146;
    int _174 = as_type<int>(_158);
    if (_71)
    {
        _136 = as_type<int>(_162);
    }
    int _176 = _136;
    if (_71)
    {
        _172 = as_type<int>(_166);
    }
    int _178 = _172;
    if (_71)
    {
        _174 = as_type<int>(_170);
    }
    int _180 = _174;
    if (_71)
    {
        out.m_32.x = as_type<float>(_176);
        out.m_32.y = as_type<float>(_178);
        out.m_32.z = as_type<float>(_180);
        out.m_32.w = 1.0;
        return out;
    }
    float _182 = abs(_162);
    float _184 = log2(_182);
    float _186 = abs(_166);
    float _188 = log2(_186);
    float _190 = abs(_170);
    float _192 = log2(_190);
    float _194 = _184 * 0.4545454680919647216796875;
    float _196 = _188 * 0.4545454680919647216796875;
    float _198 = exp2(_194);
    float _200 = _192 * 0.4545454680919647216796875;
    float _202 = exp2(_196);
    float _204 = exp2(_200);
    out.m_32.x = _198;
    out.m_32.y = _202;
    out.m_32.z = _204;
    out.m_32.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _238 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_238, float2(0.0), isnan(_238))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_238, float2(0.0), isnan(_238))).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    bool _71 = 0 != as_type<int>((*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _73 = 0.0;
    float _75 = _51;
    int _78 = as_type<int>(_57);
    float _80 = _55;
    if (!_71)
    {
        float _82 = abs(_63);
        float _84 = log2(_82);
        _73 = _84;
    }
    float _86 = _73;
    if (_71)
    {
        _75 = _63;
    }
    float _88 = _75;
    float _90 = _88;
    if (_71)
    {
        _78 = as_type<int>(_67);
    }
    int _92 = _78;
    float _94 = 0.0;
    if (!_71)
    {
        float _96 = abs(_65);
        float _98 = log2(_96);
        _94 = _98;
    }
    float _100 = _94;
    float _102 = 0.0;
    if (!_71)
    {
        float _104 = abs(_67);
        float _106 = log2(_104);
        _102 = _106;
    }
    float _108 = _102;
    float _110 = 0.0;
    float _112 = _86;
    if (!_71)
    {
        float _114 = _86 * 2.2000000476837158203125;
        _110 = _114;
    }
    float _116 = _110;
    if (_71)
    {
        _112 = _65;
    }
    float _118 = _112;
    float _120 = _100;
    if (!_71)
    {
        float _122 = _100 * 2.2000000476837158203125;
        _120 = _122;
    }
    float _124 = _120;
    if (!_71)
    {
        float _126 = exp2(_116);
        _90 = _126;
    }
    float _128 = _90;
    if (!_71)
    {
        float _130 = _108 * 2.2000000476837158203125;
        _80 = _130;
    }
    float _132 = _80;
    float _134 = _118;
    int _136 = as_type<int>(_132);
    if (!_71)
    {
        float _138 = exp2(_124);
        _134 = _138;
    }
    float _140 = _134;
    int _142 = _92;
    if (!_71)
    {
        float _144 = exp2(_132);
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    float _148 = _140 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _150 = _140 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _152 = _140 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _154 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[0].x, _148);
    float _156 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[1].x, _150);
    float _158 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[2].x, _152);
    float _160 = fma(as_type<float>(_146), (*spvDescriptorSet0.fp_c3)._m0[0].z, _154);
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = fma(as_type<float>(_146), (*spvDescriptorSet0.fp_c3)._m0[1].z, _156);
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = fma(as_type<float>(_146), (*spvDescriptorSet0.fp_c3)._m0[2].z, _158);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    int _172 = _146;
    int _174 = as_type<int>(_158);
    if (_71)
    {
        _136 = as_type<int>(_162);
    }
    int _176 = _136;
    if (_71)
    {
        _172 = as_type<int>(_166);
    }
    int _178 = _172;
    if (_71)
    {
        _174 = as_type<int>(_170);
    }
    int _180 = _174;
    if (_71)
    {
        out.m_32.x = as_type<float>(_176);
        out.m_32.y = as_type<float>(_178);
        out.m_32.z = as_type<float>(_180);
        out.m_32.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    float _182 = abs(_162);
    float _184 = log2(_182);
    float _186 = abs(_166);
    float _188 = log2(_186);
    float _190 = abs(_170);
    float _192 = log2(_190);
    float _194 = _184 * 0.4545454680919647216796875;
    float _196 = _188 * 0.4545454680919647216796875;
    float _198 = exp2(_194);
    float _200 = _192 * 0.4545454680919647216796875;
    float _202 = exp2(_196);
    float _204 = exp2(_200);
    out.m_32.x = _198;
    out.m_32.y = _202;
    out.m_32.z = _204;
    out.m_32.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_32)};
}

