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
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    bool _71 = _67 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _73 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _79 = _75;
    float _81 = _65;
    float _83 = _67;
    if (_71)
    {
        discard_fragment();
    }
    bool _85 = _75 != 0.0;
    bool _87 = isnan(_75);
    bool _89 = _85 || _87;
    bool _91 = isnan(0.0);
    bool _93 = _89 || _91;
    if (_93)
    {
        _77 = 1.0;
    }
    float _95 = _77;
    float _97 = _95;
    if (_93)
    {
        float _99 = -_95;
        float _101 = _99 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _97 = _101;
    }
    float _103 = _97;
    if (_93)
    {
        float _105 = fma(_75, _103, 1.0);
        _79 = _105;
    }
    float _107 = _79;
    if (_71)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _109 = _107;
    if (_93)
    {
        float _111 = log2(_107);
        _109 = _111;
    }
    float _113 = _109;
    float _115 = _113;
    if (_93)
    {
        float _117 = _113 + (-1.0);
        _81 = _117;
    }
    float _119 = _81;
    float _121 = _57;
    float _123 = _59;
    float _125 = _119;
    if (_93)
    {
        float2 _348 = float2(_57, _59);
        float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_348, float2(0.0), isnan(_348)), level(_119)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_348, float2(0.0), isnan(_348)), level(_119)).xyz;
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
    if (_93)
    {
        float _146 = 0.0 + _113;
        float _148 = precise::clamp(_146, 0.0, 1.0);
        _144 = as_type<int>(_148);
    }
    int _150 = _144;
    float _152 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = _158;
    float _162 = _154;
    if (_93)
    {
        float _164 = precise::min(_154, _158);
        _160 = _164;
    }
    float _166 = _160;
    if (_93)
    {
        float _168 = -_137;
        float _170 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[13].x, _168);
        _162 = _170;
    }
    float _172 = _162;
    if (_93)
    {
        float _174 = -_139;
        float _176 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[13].y, _174);
        _83 = _176;
    }
    float _178 = _83;
    if (_93)
    {
        float _180 = -_141;
        float _182 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].z, _180);
        _115 = _182;
    }
    float _184 = _115;
    int _186 = 0;
    if (_93)
    {
        float _188 = fma(_166, _172, _137);
        _186 = as_type<int>(_188);
    }
    int _190 = _186;
    int _192 = 0;
    if (_93)
    {
        float _194 = fma(_166, _178, _139);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    int _198 = 0;
    if (_93)
    {
        float _200 = fma(_166, _184, _141);
        _198 = as_type<int>(_200);
    }
    int _202 = _198;
    if (_93)
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
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    bool _71 = _67 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _73 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _79 = _75;
    float _81 = _65;
    float _83 = _67;
    if (_71)
    {
        discard_fragment();
    }
    bool _85 = _75 != 0.0;
    bool _87 = isnan(_75);
    bool _89 = _85 || _87;
    bool _91 = isnan(0.0);
    bool _93 = _89 || _91;
    if (_93)
    {
        _77 = 1.0;
    }
    float _95 = _77;
    float _97 = _95;
    if (_93)
    {
        float _99 = -_95;
        float _101 = _99 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _97 = _101;
    }
    float _103 = _97;
    if (_93)
    {
        float _105 = fma(_75, _103, 1.0);
        _79 = _105;
    }
    float _107 = _79;
    if (_71)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    float _109 = _107;
    if (_93)
    {
        float _111 = log2(_107);
        _109 = _111;
    }
    float _113 = _109;
    float _115 = _113;
    if (_93)
    {
        float _117 = _113 + (-1.0);
        _81 = _117;
    }
    float _119 = _81;
    float _121 = _57;
    float _123 = _59;
    float _125 = _119;
    if (_93)
    {
        float2 _348 = float2(_57, _59);
        float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_348, float2(0.0), isnan(_348)), level(_119)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_348, float2(0.0), isnan(_348)), level(_119)).xyz;
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
    if (_93)
    {
        float _146 = 0.0 + _113;
        float _148 = precise::clamp(_146, 0.0, 1.0);
        _144 = as_type<int>(_148);
    }
    int _150 = _144;
    float _152 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = _158;
    float _162 = _154;
    if (_93)
    {
        float _164 = precise::min(_154, _158);
        _160 = _164;
    }
    float _166 = _160;
    if (_93)
    {
        float _168 = -_137;
        float _170 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[13].x, _168);
        _162 = _170;
    }
    float _172 = _162;
    if (_93)
    {
        float _174 = -_139;
        float _176 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[13].y, _174);
        _83 = _176;
    }
    float _178 = _83;
    if (_93)
    {
        float _180 = -_141;
        float _182 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].z, _180);
        _115 = _182;
    }
    float _184 = _115;
    int _186 = 0;
    if (_93)
    {
        float _188 = fma(_166, _172, _137);
        _186 = as_type<int>(_188);
    }
    int _190 = _186;
    int _192 = 0;
    if (_93)
    {
        float _194 = fma(_166, _178, _139);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    int _198 = 0;
    if (_93)
    {
        float _200 = fma(_166, _184, _141);
        _198 = as_type<int>(_200);
    }
    int _202 = _198;
    if (_93)
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

