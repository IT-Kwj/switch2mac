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
    float2 _242 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_242, float2(0.0), isnan(_242))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_242, float2(0.0), isnan(_242))).x;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _71 = precise::clamp(_69, 0.0, 1.0);
    bool _75 = _67 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _77 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _79 = precise::clamp(_77, 0.0, 1.0);
    bool _81 = !_75;
    float _83 = _81 ? _71 : 0.0;
    float _85 = precise::max(_83, _79);
    bool _87 = _85 != 0.0;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _65;
    float _101 = _85;
    if (_95)
    {
        _97 = 1.0;
    }
    float _103 = _97;
    float _105 = _103;
    if (_95)
    {
        float _107 = -_103;
        float _109 = _107 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _105 = _109;
    }
    float _111 = _105;
    if (_95)
    {
        float _113 = fma(_85, _111, 1.0);
        _99 = _113;
    }
    float _115 = _99;
    float _117 = _115;
    if (_95)
    {
        float _119 = log2(_115);
        _117 = _119;
    }
    float _121 = _117;
    if (_95)
    {
        float _123 = _121 + (-1.0);
        _101 = _123;
    }
    float _125 = _101;
    float _127 = _57;
    float _129 = _59;
    float _131 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    if (_95)
    {
        float2 _357 = float2(_57, _59);
        float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_357, float2(0.0), isnan(_357)), level(_125)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_357, float2(0.0), isnan(_357)), level(_125)).xyz;
        float _137 = _135.x;
        float _139 = _135.y;
        float _141 = _135.z;
        _127 = _137;
        _129 = _139;
        _131 = _141;
    }
    float _143 = _127;
    float _145 = _129;
    float _147 = _131;
    int _150 = 0;
    if (_95)
    {
        float _152 = 0.0 + _121;
        float _154 = precise::clamp(_152, 0.0, 1.0);
        _150 = as_type<int>(_154);
    }
    int _156 = _150;
    float _158 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = precise::min(_160, _164);
    float _168 = _160;
    float _170 = (*spvDescriptorSet0.fp_c3)._m0[4].w;
    if (_95)
    {
        float _172 = -_143;
        float _174 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].x, _172);
        _168 = _174;
    }
    float _176 = _168;
    if (_95)
    {
        float _178 = -_145;
        float _180 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].y, _178);
        _170 = _180;
    }
    float _182 = _170;
    float _184 = 0.0;
    if (_95)
    {
        float _186 = -_147;
        float _188 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[13].z, _186);
        _184 = _188;
    }
    float _190 = _184;
    int _192 = 0;
    if (_95)
    {
        float _194 = fma(_166, _176, _143);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    int _198 = 0;
    if (_95)
    {
        float _200 = fma(_166, _182, _145);
        _198 = as_type<int>(_200);
    }
    int _202 = _198;
    int _204 = 0;
    if (_95)
    {
        float _206 = fma(_166, _190, _147);
        _204 = as_type<int>(_206);
    }
    int _208 = _204;
    if (_95)
    {
        out.m_34.x = as_type<float>(_196);
        out.m_34.y = as_type<float>(_202);
        out.m_34.z = as_type<float>(_208);
        out.m_34.w = as_type<float>(_156);
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
    float2 _242 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_242, float2(0.0), isnan(_242))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_242, float2(0.0), isnan(_242))).x;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _71 = precise::clamp(_69, 0.0, 1.0);
    bool _75 = _67 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _77 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _79 = precise::clamp(_77, 0.0, 1.0);
    bool _81 = !_75;
    float _83 = _81 ? _71 : 0.0;
    float _85 = precise::max(_83, _79);
    bool _87 = _85 != 0.0;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _65;
    float _101 = _85;
    if (_95)
    {
        _97 = 1.0;
    }
    float _103 = _97;
    float _105 = _103;
    if (_95)
    {
        float _107 = -_103;
        float _109 = _107 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _105 = _109;
    }
    float _111 = _105;
    if (_95)
    {
        float _113 = fma(_85, _111, 1.0);
        _99 = _113;
    }
    float _115 = _99;
    float _117 = _115;
    if (_95)
    {
        float _119 = log2(_115);
        _117 = _119;
    }
    float _121 = _117;
    if (_95)
    {
        float _123 = _121 + (-1.0);
        _101 = _123;
    }
    float _125 = _101;
    float _127 = _57;
    float _129 = _59;
    float _131 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    if (_95)
    {
        float2 _357 = float2(_57, _59);
        float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_357, float2(0.0), isnan(_357)), level(_125)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_357, float2(0.0), isnan(_357)), level(_125)).xyz;
        float _137 = _135.x;
        float _139 = _135.y;
        float _141 = _135.z;
        _127 = _137;
        _129 = _139;
        _131 = _141;
    }
    float _143 = _127;
    float _145 = _129;
    float _147 = _131;
    int _150 = 0;
    if (_95)
    {
        float _152 = 0.0 + _121;
        float _154 = precise::clamp(_152, 0.0, 1.0);
        _150 = as_type<int>(_154);
    }
    int _156 = _150;
    float _158 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = precise::min(_160, _164);
    float _168 = _160;
    float _170 = (*spvDescriptorSet0.fp_c3)._m0[4].w;
    if (_95)
    {
        float _172 = -_143;
        float _174 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].x, _172);
        _168 = _174;
    }
    float _176 = _168;
    if (_95)
    {
        float _178 = -_145;
        float _180 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].y, _178);
        _170 = _180;
    }
    float _182 = _170;
    float _184 = 0.0;
    if (_95)
    {
        float _186 = -_147;
        float _188 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[13].z, _186);
        _184 = _188;
    }
    float _190 = _184;
    int _192 = 0;
    if (_95)
    {
        float _194 = fma(_166, _176, _143);
        _192 = as_type<int>(_194);
    }
    int _196 = _192;
    int _198 = 0;
    if (_95)
    {
        float _200 = fma(_166, _182, _145);
        _198 = as_type<int>(_200);
    }
    int _202 = _198;
    int _204 = 0;
    if (_95)
    {
        float _206 = fma(_166, _190, _147);
        _204 = as_type<int>(_206);
    }
    int _208 = _204;
    if (_95)
    {
        out.m_34.x = as_type<float>(_196);
        out.m_34.y = as_type<float>(_202);
        out.m_34.z = as_type<float>(_208);
        out.m_34.w = as_type<float>(_156);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_34)};
}

