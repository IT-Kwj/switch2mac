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
    float2 _236 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_236, float2(0.0), isnan(_236))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_236, float2(0.0), isnan(_236))).x;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _65 = precise::clamp(_63, 0.0, 1.0);
    bool _69 = _61 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _71 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _73 = precise::clamp(_71, 0.0, 1.0);
    bool _75 = !_69;
    float _77 = _75 ? _65 : 0.0;
    float _79 = precise::max(_77, _73);
    bool _81 = _79 != 0.0;
    bool _83 = isnan(_79);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    float _91 = _73;
    float _93 = _79;
    if (_89)
    {
        _91 = 1.0;
    }
    float _95 = _91;
    float _97 = _95;
    if (_89)
    {
        float _99 = -_95;
        float _101 = _99 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _97 = _101;
    }
    float _103 = _97;
    float _105 = _103;
    if (_89)
    {
        float _107 = fma(_79, _103, 1.0);
        _93 = _107;
    }
    float _109 = _93;
    float _111 = _109;
    if (_89)
    {
        float _113 = log2(_109);
        _111 = _113;
    }
    float _115 = _111;
    if (_89)
    {
        float _117 = _115 + (-1.0);
        _105 = _117;
    }
    float _119 = _105;
    float _121 = _57;
    float _123 = _59;
    float _125 = 0.0;
    if (_89)
    {
        float2 _338 = float2(_57, _59);
        float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_338, float2(0.0), isnan(_338)), level(_119)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_338, float2(0.0), isnan(_338)), level(_119)).xyz;
        float _131 = _129.x;
        float _133 = _129.y;
        float _135 = _129.z;
        _121 = _131;
        _123 = _133;
        _125 = _135;
    }
    float _137 = _121;
    float _139 = _123;
    float _141 = _125;
    int _144 = 0;
    if (_89)
    {
        float _146 = 0.0 + _115;
        float _148 = precise::clamp(_146, 0.0, 1.0);
        _144 = as_type<int>(_148);
    }
    int _150 = _144;
    float _152 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = precise::min(_154, _158);
    float _162 = _158;
    float _164 = (*spvDescriptorSet0.fp_c3)._m0[4].w;
    if (_89)
    {
        float _166 = -_137;
        float _168 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[13].x, _166);
        _162 = _168;
    }
    float _170 = _162;
    float _172 = 0.0;
    if (_89)
    {
        float _174 = -_139;
        float _176 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[13].y, _174);
        _172 = _176;
    }
    float _178 = _172;
    if (_89)
    {
        float _180 = -_141;
        float _182 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].z, _180);
        _164 = _182;
    }
    float _184 = _164;
    int _186 = 0;
    if (_89)
    {
        float _188 = fma(_160, _170, _137);
        _186 = as_type<int>(_188);
    }
    int _190 = _186;
    int _192 = 0;
    if (_89)
    {
        float _194 = fma(_160, _178, _139);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    int _198 = 0;
    if (_89)
    {
        float _200 = fma(_160, _184, _141);
        _198 = as_type<int>(_200);
    }
    int _202 = _198;
    if (_89)
    {
        out.m_34.x = as_type<float>(_190);
        out.m_34.y = as_type<float>(_196);
        out.m_34.z = as_type<float>(_202);
        out.m_34.w = as_type<float>(_150);
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
    float2 _236 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_236, float2(0.0), isnan(_236))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_236, float2(0.0), isnan(_236))).x;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _65 = precise::clamp(_63, 0.0, 1.0);
    bool _69 = _61 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _71 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _73 = precise::clamp(_71, 0.0, 1.0);
    bool _75 = !_69;
    float _77 = _75 ? _65 : 0.0;
    float _79 = precise::max(_77, _73);
    bool _81 = _79 != 0.0;
    bool _83 = isnan(_79);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    float _91 = _73;
    float _93 = _79;
    if (_89)
    {
        _91 = 1.0;
    }
    float _95 = _91;
    float _97 = _95;
    if (_89)
    {
        float _99 = -_95;
        float _101 = _99 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _97 = _101;
    }
    float _103 = _97;
    float _105 = _103;
    if (_89)
    {
        float _107 = fma(_79, _103, 1.0);
        _93 = _107;
    }
    float _109 = _93;
    float _111 = _109;
    if (_89)
    {
        float _113 = log2(_109);
        _111 = _113;
    }
    float _115 = _111;
    if (_89)
    {
        float _117 = _115 + (-1.0);
        _105 = _117;
    }
    float _119 = _105;
    float _121 = _57;
    float _123 = _59;
    float _125 = 0.0;
    if (_89)
    {
        float2 _338 = float2(_57, _59);
        float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_338, float2(0.0), isnan(_338)), level(_119)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_338, float2(0.0), isnan(_338)), level(_119)).xyz;
        float _131 = _129.x;
        float _133 = _129.y;
        float _135 = _129.z;
        _121 = _131;
        _123 = _133;
        _125 = _135;
    }
    float _137 = _121;
    float _139 = _123;
    float _141 = _125;
    int _144 = 0;
    if (_89)
    {
        float _146 = 0.0 + _115;
        float _148 = precise::clamp(_146, 0.0, 1.0);
        _144 = as_type<int>(_148);
    }
    int _150 = _144;
    float _152 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = precise::min(_154, _158);
    float _162 = _158;
    float _164 = (*spvDescriptorSet0.fp_c3)._m0[4].w;
    if (_89)
    {
        float _166 = -_137;
        float _168 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[13].x, _166);
        _162 = _168;
    }
    float _170 = _162;
    float _172 = 0.0;
    if (_89)
    {
        float _174 = -_139;
        float _176 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[13].y, _174);
        _172 = _176;
    }
    float _178 = _172;
    if (_89)
    {
        float _180 = -_141;
        float _182 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].z, _180);
        _164 = _182;
    }
    float _184 = _164;
    int _186 = 0;
    if (_89)
    {
        float _188 = fma(_160, _170, _137);
        _186 = as_type<int>(_188);
    }
    int _190 = _186;
    int _192 = 0;
    if (_89)
    {
        float _194 = fma(_160, _178, _139);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    int _198 = 0;
    if (_89)
    {
        float _200 = fma(_160, _184, _141);
        _198 = as_type<int>(_200);
    }
    int _202 = _198;
    if (_89)
    {
        out.m_34.x = as_type<float>(_190);
        out.m_34.y = as_type<float>(_196);
        out.m_34.z = as_type<float>(_202);
        out.m_34.w = as_type<float>(_150);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_34)};
}

