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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _260 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_260, float2(0.0), isnan(_260))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_260, float2(0.0), isnan(_260))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = -_63;
    float _75 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _77 = 1.0 / _75;
    float _79 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _81 = precise::clamp(_79, 0.0, 1.0);
    float _83 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = precise::max(_81, _85);
    float _89 = precise::max(_87, _71);
    bool _93 = _89 != 0.0;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.0);
    bool _101 = _97 || _99;
    float _103 = _85;
    float _105 = _77;
    float _107 = (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _109 = _89;
    if (_101)
    {
        _103 = 1.0;
    }
    float _111 = _103;
    float _113 = _111;
    if (_101)
    {
        float _115 = -_111;
        float _117 = _115 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _113 = _117;
    }
    float _119 = _113;
    if (_101)
    {
        float _121 = fma(_89, _119, 1.0);
        _105 = _121;
    }
    float _123 = _105;
    float _125 = _123;
    if (_101)
    {
        float _127 = log2(_123);
        _125 = _127;
    }
    float _129 = _125;
    float _131 = _129;
    if (_101)
    {
        float _133 = _129 + (-1.0);
        _107 = _133;
    }
    float _135 = _107;
    int _138 = as_type<int>(_59);
    int _140 = as_type<int>(_61);
    float _142 = _135;
    if (_101)
    {
        float2 _383 = float2(_59, _61);
        float3 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_383, float2(0.0), isnan(_383)), level(_135)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_383, float2(0.0), isnan(_383)), level(_135)).xyz;
        float _148 = _146.x;
        float _150 = _146.y;
        float _152 = _146.z;
        _138 = as_type<int>(_148);
        _140 = as_type<int>(_150);
        _142 = _152;
    }
    int _154 = _138;
    int _156 = _140;
    float _158 = _142;
    float _160 = in.m_33.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_33.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _57 * _164;
    float _174 = _57 * _170;
    float _176 = _170;
    if (_101)
    {
        float _178 = 0.0 + _129;
        float _180 = precise::clamp(_178, 0.0, 1.0);
        _176 = _180;
    }
    float _182 = _176;
    float _184 = _182;
    if (_101)
    {
        float _186 = fma(_174, _182, _172);
        _109 = _186;
    }
    float _188 = _109;
    if (_101)
    {
        float _190 = _182 * _174;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = 0.0;
    float _196 = _192;
    if (_101)
    {
        float _198 = 1.0 / _188;
        _194 = _198;
    }
    float _200 = _194;
    int _202 = _154;
    int _204 = _156;
    if (_101)
    {
        float _206 = _158 * _192;
        _131 = _206;
    }
    float _208 = _131;
    int _210 = as_type<int>(_208);
    if (_101)
    {
        float _212 = _200 * _192;
        _196 = _212;
    }
    float _214 = _196;
    if (_101)
    {
        float _216 = _208 * _200;
        _210 = as_type<int>(_216);
    }
    int _218 = _210;
    if (_101)
    {
        float _220 = as_type<float>(_154) * _214;
        _202 = as_type<int>(_220);
    }
    int _222 = _202;
    if (_101)
    {
        float _224 = as_type<float>(_156) * _214;
        _204 = as_type<int>(_224);
    }
    int _226 = _204;
    if (_101)
    {
        out.m_36.x = as_type<float>(_222);
        out.m_36.y = as_type<float>(_226);
        out.m_36.z = as_type<float>(_218);
        out.m_36.w = _188;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _172;
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
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _260 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_260, float2(0.0), isnan(_260))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_260, float2(0.0), isnan(_260))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = -_63;
    float _75 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _77 = 1.0 / _75;
    float _79 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _81 = precise::clamp(_79, 0.0, 1.0);
    float _83 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = precise::max(_81, _85);
    float _89 = precise::max(_87, _71);
    bool _93 = _89 != 0.0;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.0);
    bool _101 = _97 || _99;
    float _103 = _85;
    float _105 = _77;
    float _107 = (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _109 = _89;
    if (_101)
    {
        _103 = 1.0;
    }
    float _111 = _103;
    float _113 = _111;
    if (_101)
    {
        float _115 = -_111;
        float _117 = _115 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _113 = _117;
    }
    float _119 = _113;
    if (_101)
    {
        float _121 = fma(_89, _119, 1.0);
        _105 = _121;
    }
    float _123 = _105;
    float _125 = _123;
    if (_101)
    {
        float _127 = log2(_123);
        _125 = _127;
    }
    float _129 = _125;
    float _131 = _129;
    if (_101)
    {
        float _133 = _129 + (-1.0);
        _107 = _133;
    }
    float _135 = _107;
    int _138 = as_type<int>(_59);
    int _140 = as_type<int>(_61);
    float _142 = _135;
    if (_101)
    {
        float2 _383 = float2(_59, _61);
        float3 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_383, float2(0.0), isnan(_383)), level(_135)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_383, float2(0.0), isnan(_383)), level(_135)).xyz;
        float _148 = _146.x;
        float _150 = _146.y;
        float _152 = _146.z;
        _138 = as_type<int>(_148);
        _140 = as_type<int>(_150);
        _142 = _152;
    }
    int _154 = _138;
    int _156 = _140;
    float _158 = _142;
    float _160 = in.m_33.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_33.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _57 * _164;
    float _174 = _57 * _170;
    float _176 = _170;
    if (_101)
    {
        float _178 = 0.0 + _129;
        float _180 = precise::clamp(_178, 0.0, 1.0);
        _176 = _180;
    }
    float _182 = _176;
    float _184 = _182;
    if (_101)
    {
        float _186 = fma(_174, _182, _172);
        _109 = _186;
    }
    float _188 = _109;
    if (_101)
    {
        float _190 = _182 * _174;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = 0.0;
    float _196 = _192;
    if (_101)
    {
        float _198 = 1.0 / _188;
        _194 = _198;
    }
    float _200 = _194;
    int _202 = _154;
    int _204 = _156;
    if (_101)
    {
        float _206 = _158 * _192;
        _131 = _206;
    }
    float _208 = _131;
    int _210 = as_type<int>(_208);
    if (_101)
    {
        float _212 = _200 * _192;
        _196 = _212;
    }
    float _214 = _196;
    if (_101)
    {
        float _216 = _208 * _200;
        _210 = as_type<int>(_216);
    }
    int _218 = _210;
    if (_101)
    {
        float _220 = as_type<float>(_154) * _214;
        _202 = as_type<int>(_220);
    }
    int _222 = _202;
    if (_101)
    {
        float _224 = as_type<float>(_156) * _214;
        _204 = as_type<int>(_224);
    }
    int _226 = _204;
    if (_101)
    {
        out.m_36.x = as_type<float>(_222);
        out.m_36.y = as_type<float>(_226);
        out.m_36.z = as_type<float>(_218);
        out.m_36.w = _188;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _172;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

