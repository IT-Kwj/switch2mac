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
    float2 _236 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_236, float2(0.0), isnan(_236))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_236, float2(0.0), isnan(_236))).x;
    float2 _247 = float2(_59, _61);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_247, float2(0.0), isnan(_247))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_247, float2(0.0), isnan(_247))).x;
    float _67 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    bool _73 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _75 = !_73;
    float _77 = _75 ? _69 : 0.0;
    float _79 = precise::max(_65, _77);
    bool _81 = _79 != 0.0;
    bool _83 = isnan(_79);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    float _91 = _77;
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
    float _121 = _59;
    float _123 = _61;
    float _125 = 0.0;
    if (_89)
    {
        float2 _338 = float2(_59, _61);
        float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_338, float2(0.0), isnan(_338)), level(_119)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_338, float2(0.0), isnan(_338)), level(_119)).xyz;
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
    float _152 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
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
        out.m_36.x = as_type<float>(_190);
        out.m_36.y = as_type<float>(_196);
        out.m_36.z = as_type<float>(_202);
        out.m_36.w = as_type<float>(_150);
        return out;
    }
    discard_fragment();
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
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
    float2 _236 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_236, float2(0.0), isnan(_236))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_236, float2(0.0), isnan(_236))).x;
    float2 _247 = float2(_59, _61);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_247, float2(0.0), isnan(_247))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_247, float2(0.0), isnan(_247))).x;
    float _67 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    bool _73 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _75 = !_73;
    float _77 = _75 ? _69 : 0.0;
    float _79 = precise::max(_65, _77);
    bool _81 = _79 != 0.0;
    bool _83 = isnan(_79);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    float _91 = _77;
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
    float _121 = _59;
    float _123 = _61;
    float _125 = 0.0;
    if (_89)
    {
        float2 _338 = float2(_59, _61);
        float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_338, float2(0.0), isnan(_338)), level(_119)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_338, float2(0.0), isnan(_338)), level(_119)).xyz;
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
    float _152 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
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
        out.m_36.x = as_type<float>(_190);
        out.m_36.y = as_type<float>(_196);
        out.m_36.z = as_type<float>(_202);
        out.m_36.w = as_type<float>(_150);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_36)};
}

