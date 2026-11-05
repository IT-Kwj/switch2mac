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
    float2 _242 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_242, float2(0.0), isnan(_242))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_242, float2(0.0), isnan(_242))).x;
    float2 _253 = float2(_59, _61);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_253, float2(0.0), isnan(_253))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_253, float2(0.0), isnan(_253))).x;
    float _67 = -_63;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    float _73 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    bool _79 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _81 = !_79;
    float _83 = _81 ? _75 : 0.0;
    float _85 = precise::max(_65, _83);
    bool _87 = _85 != 0.0;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = _83;
    float _99 = _85;
    float _101 = _69;
    float _103 = _71;
    if (_95)
    {
        _97 = 1.0;
    }
    float _105 = _97;
    float _107 = _105;
    if (_95)
    {
        float _109 = -_105;
        float _111 = _109 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _107 = _111;
    }
    float _113 = _107;
    if (_95)
    {
        float _115 = fma(_85, _113, 1.0);
        _99 = _115;
    }
    float _117 = _99;
    float _119 = _117;
    if (_95)
    {
        float _121 = log2(_117);
        _119 = _121;
    }
    float _123 = _119;
    if (_95)
    {
        float _125 = _123 + (-1.0);
        _101 = _125;
    }
    float _127 = _101;
    float _129 = _59;
    float _131 = _61;
    float _133 = 0.0;
    if (_95)
    {
        float2 _356 = float2(_59, _61);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_356, float2(0.0), isnan(_356)), level(_127)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_356, float2(0.0), isnan(_356)), level(_127)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        _129 = _139;
        _131 = _141;
        _133 = _143;
    }
    float _145 = _129;
    float _147 = _131;
    float _149 = _133;
    int _152 = 0;
    if (_95)
    {
        float _154 = 0.0 + _123;
        float _156 = precise::clamp(_154, 0.0, 1.0);
        _152 = as_type<int>(_156);
    }
    int _158 = _152;
    float _160 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = precise::min(_162, _166);
    float _170 = _162;
    float _172 = (*spvDescriptorSet0.fp_c3)._m0[4].w;
    if (_95)
    {
        float _174 = -_145;
        float _176 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].x, _174);
        _170 = _176;
    }
    float _178 = _170;
    if (_95)
    {
        float _180 = -_147;
        float _182 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[13].y, _180);
        _172 = _182;
    }
    float _184 = _172;
    if (_95)
    {
        float _186 = -_149;
        float _188 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[13].z, _186);
        _103 = _188;
    }
    float _190 = _103;
    int _192 = 0;
    if (_95)
    {
        float _194 = fma(_168, _178, _145);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    int _198 = 0;
    if (_95)
    {
        float _200 = fma(_168, _184, _147);
        _198 = as_type<int>(_200);
    }
    int _202 = _198;
    int _204 = 0;
    if (_95)
    {
        float _206 = fma(_168, _190, _149);
        _204 = as_type<int>(_206);
    }
    int _208 = _204;
    if (_95)
    {
        out.m_36.x = as_type<float>(_196);
        out.m_36.y = as_type<float>(_202);
        out.m_36.z = as_type<float>(_208);
        out.m_36.w = as_type<float>(_158);
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
    float2 _242 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_242, float2(0.0), isnan(_242))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_242, float2(0.0), isnan(_242))).x;
    float2 _253 = float2(_59, _61);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_253, float2(0.0), isnan(_253))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_253, float2(0.0), isnan(_253))).x;
    float _67 = -_63;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    float _73 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    bool _79 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _81 = !_79;
    float _83 = _81 ? _75 : 0.0;
    float _85 = precise::max(_65, _83);
    bool _87 = _85 != 0.0;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = _83;
    float _99 = _85;
    float _101 = _69;
    float _103 = _71;
    if (_95)
    {
        _97 = 1.0;
    }
    float _105 = _97;
    float _107 = _105;
    if (_95)
    {
        float _109 = -_105;
        float _111 = _109 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _107 = _111;
    }
    float _113 = _107;
    if (_95)
    {
        float _115 = fma(_85, _113, 1.0);
        _99 = _115;
    }
    float _117 = _99;
    float _119 = _117;
    if (_95)
    {
        float _121 = log2(_117);
        _119 = _121;
    }
    float _123 = _119;
    if (_95)
    {
        float _125 = _123 + (-1.0);
        _101 = _125;
    }
    float _127 = _101;
    float _129 = _59;
    float _131 = _61;
    float _133 = 0.0;
    if (_95)
    {
        float2 _356 = float2(_59, _61);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_356, float2(0.0), isnan(_356)), level(_127)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_356, float2(0.0), isnan(_356)), level(_127)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        _129 = _139;
        _131 = _141;
        _133 = _143;
    }
    float _145 = _129;
    float _147 = _131;
    float _149 = _133;
    int _152 = 0;
    if (_95)
    {
        float _154 = 0.0 + _123;
        float _156 = precise::clamp(_154, 0.0, 1.0);
        _152 = as_type<int>(_156);
    }
    int _158 = _152;
    float _160 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = precise::min(_162, _166);
    float _170 = _162;
    float _172 = (*spvDescriptorSet0.fp_c3)._m0[4].w;
    if (_95)
    {
        float _174 = -_145;
        float _176 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].x, _174);
        _170 = _176;
    }
    float _178 = _170;
    if (_95)
    {
        float _180 = -_147;
        float _182 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[13].y, _180);
        _172 = _182;
    }
    float _184 = _172;
    if (_95)
    {
        float _186 = -_149;
        float _188 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[13].z, _186);
        _103 = _188;
    }
    float _190 = _103;
    int _192 = 0;
    if (_95)
    {
        float _194 = fma(_168, _178, _145);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    int _198 = 0;
    if (_95)
    {
        float _200 = fma(_168, _184, _147);
        _198 = as_type<int>(_200);
    }
    int _202 = _198;
    int _204 = 0;
    if (_95)
    {
        float _206 = fma(_168, _190, _149);
        _204 = as_type<int>(_206);
    }
    int _208 = _204;
    if (_95)
    {
        out.m_36.x = as_type<float>(_196);
        out.m_36.y = as_type<float>(_202);
        out.m_36.z = as_type<float>(_208);
        out.m_36.w = as_type<float>(_158);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_36)};
}

