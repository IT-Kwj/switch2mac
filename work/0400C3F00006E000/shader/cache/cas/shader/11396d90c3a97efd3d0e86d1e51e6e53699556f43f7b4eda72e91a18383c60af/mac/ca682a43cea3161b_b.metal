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
    float2 _228 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_228, float2(0.0), isnan(_228))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_228, float2(0.0), isnan(_228))).x;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _65 = precise::clamp(_63, 0.0, 1.0);
    bool _69 = _65 != 0.0;
    bool _71 = isnan(_65);
    bool _73 = _69 || _71;
    bool _75 = isnan(0.0);
    bool _77 = _73 || _75;
    float _79 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _81 = _65;
    if (_77)
    {
        _79 = 1.0;
    }
    float _83 = _79;
    float _85 = _83;
    if (_77)
    {
        float _87 = -_83;
        float _89 = _87 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _85 = _89;
    }
    float _91 = _85;
    float _93 = _91;
    if (_77)
    {
        float _95 = fma(_65, _91, 1.0);
        _81 = _95;
    }
    float _97 = _81;
    float _99 = _97;
    if (_77)
    {
        float _101 = log2(_97);
        _99 = _101;
    }
    float _103 = _99;
    float _105 = _103;
    if (_77)
    {
        float _107 = _103 + (-1.0);
        _93 = _107;
    }
    float _109 = _93;
    float _111 = _55;
    float _113 = 0.0;
    float _115 = _109;
    if (_77)
    {
        float2 _311 = float2(_57, _59);
        float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_311, float2(0.0), isnan(_311)), level(_109)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_311, float2(0.0), isnan(_311)), level(_109)).xyz;
        float _121 = _119.x;
        float _123 = _119.y;
        float _125 = _119.z;
        _111 = _121;
        _113 = _123;
        _115 = _125;
    }
    float _127 = _111;
    float _129 = _113;
    float _131 = _115;
    int _134 = 0;
    if (_77)
    {
        float _136 = 0.0 + _103;
        float _138 = precise::clamp(_136, 0.0, 1.0);
        _134 = as_type<int>(_138);
    }
    int _140 = _134;
    float _142 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = _144;
    float _152 = _148;
    if (_77)
    {
        float _154 = precise::min(_144, _148);
        _150 = _154;
    }
    float _156 = _150;
    if (_77)
    {
        float _158 = -_127;
        float _160 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[13].x, _158);
        _152 = _160;
    }
    float _162 = _152;
    float _164 = 0.0;
    if (_77)
    {
        float _166 = -_129;
        float _168 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[13].y, _166);
        _164 = _168;
    }
    float _170 = _164;
    if (_77)
    {
        float _172 = -_131;
        float _174 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[13].z, _172);
        _105 = _174;
    }
    float _176 = _105;
    int _178 = 0;
    if (_77)
    {
        float _180 = fma(_156, _162, _127);
        _178 = as_type<int>(_180);
    }
    int _182 = _178;
    int _184 = 0;
    if (_77)
    {
        float _186 = fma(_156, _170, _129);
        _184 = as_type<int>(_186);
    }
    int _188 = _184;
    int _190 = 0;
    if (_77)
    {
        float _192 = fma(_156, _176, _131);
        _190 = as_type<int>(_192);
    }
    int _194 = _190;
    if (_77)
    {
        out.m_34.x = as_type<float>(_182);
        out.m_34.y = as_type<float>(_188);
        out.m_34.z = as_type<float>(_194);
        out.m_34.w = as_type<float>(_140);
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
    float2 _228 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_228, float2(0.0), isnan(_228))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_228, float2(0.0), isnan(_228))).x;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _65 = precise::clamp(_63, 0.0, 1.0);
    bool _69 = _65 != 0.0;
    bool _71 = isnan(_65);
    bool _73 = _69 || _71;
    bool _75 = isnan(0.0);
    bool _77 = _73 || _75;
    float _79 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _81 = _65;
    if (_77)
    {
        _79 = 1.0;
    }
    float _83 = _79;
    float _85 = _83;
    if (_77)
    {
        float _87 = -_83;
        float _89 = _87 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _85 = _89;
    }
    float _91 = _85;
    float _93 = _91;
    if (_77)
    {
        float _95 = fma(_65, _91, 1.0);
        _81 = _95;
    }
    float _97 = _81;
    float _99 = _97;
    if (_77)
    {
        float _101 = log2(_97);
        _99 = _101;
    }
    float _103 = _99;
    float _105 = _103;
    if (_77)
    {
        float _107 = _103 + (-1.0);
        _93 = _107;
    }
    float _109 = _93;
    float _111 = _55;
    float _113 = 0.0;
    float _115 = _109;
    if (_77)
    {
        float2 _311 = float2(_57, _59);
        float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_311, float2(0.0), isnan(_311)), level(_109)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_311, float2(0.0), isnan(_311)), level(_109)).xyz;
        float _121 = _119.x;
        float _123 = _119.y;
        float _125 = _119.z;
        _111 = _121;
        _113 = _123;
        _115 = _125;
    }
    float _127 = _111;
    float _129 = _113;
    float _131 = _115;
    int _134 = 0;
    if (_77)
    {
        float _136 = 0.0 + _103;
        float _138 = precise::clamp(_136, 0.0, 1.0);
        _134 = as_type<int>(_138);
    }
    int _140 = _134;
    float _142 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = _144;
    float _152 = _148;
    if (_77)
    {
        float _154 = precise::min(_144, _148);
        _150 = _154;
    }
    float _156 = _150;
    if (_77)
    {
        float _158 = -_127;
        float _160 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[13].x, _158);
        _152 = _160;
    }
    float _162 = _152;
    float _164 = 0.0;
    if (_77)
    {
        float _166 = -_129;
        float _168 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[13].y, _166);
        _164 = _168;
    }
    float _170 = _164;
    if (_77)
    {
        float _172 = -_131;
        float _174 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[13].z, _172);
        _105 = _174;
    }
    float _176 = _105;
    int _178 = 0;
    if (_77)
    {
        float _180 = fma(_156, _162, _127);
        _178 = as_type<int>(_180);
    }
    int _182 = _178;
    int _184 = 0;
    if (_77)
    {
        float _186 = fma(_156, _170, _129);
        _184 = as_type<int>(_186);
    }
    int _188 = _184;
    int _190 = 0;
    if (_77)
    {
        float _192 = fma(_156, _176, _131);
        _190 = as_type<int>(_192);
    }
    int _194 = _190;
    if (_77)
    {
        out.m_34.x = as_type<float>(_182);
        out.m_34.y = as_type<float>(_188);
        out.m_34.z = as_type<float>(_194);
        out.m_34.w = as_type<float>(_140);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_34)};
}

