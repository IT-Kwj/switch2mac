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
    float4 m_38 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _272 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_272, float2(0.0), isnan(_272))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_272, float2(0.0), isnan(_272))).x;
    float _67 = -_65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    bool _75 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_75)
    {
        discard_fragment();
    }
    float2 _304 = float2(_61, _63);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_304, float2(0.0), isnan(_304))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_304, float2(0.0), isnan(_304))).x;
    if (_75)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _79 = in.m_38.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    float _89 = precise::max(_77, _87);
    float _91 = _59 * _83;
    float _93 = precise::max(_89, _91);
    bool _95 = _93 != 0.0;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.0);
    bool _103 = _99 || _101;
    float _105 = _87;
    float _107 = _83;
    if (_103)
    {
        _105 = 1.0;
    }
    float _109 = _105;
    float _111 = _109;
    if (_103)
    {
        float _113 = -_109;
        float _115 = _113 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _111 = _115;
    }
    float _117 = _111;
    if (_103)
    {
        float _119 = fma(_93, _117, 1.0);
        _107 = _119;
    }
    float _121 = _107;
    float _123 = _121;
    if (_103)
    {
        float _125 = log2(_121);
        _123 = _125;
    }
    float _127 = _123;
    float _129 = 0.0;
    float _131 = _127;
    if (_103)
    {
        float _133 = _127 + (-1.0);
        _129 = _133;
    }
    float _135 = _129;
    float _137 = _61;
    float _139 = _63;
    float _141 = 0.0;
    if (_103)
    {
        float2 _404 = float2(_61, _63);
        float3 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_404, float2(0.0), isnan(_404)), level(_135)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_404, float2(0.0), isnan(_404)), level(_135)).xyz;
        float _147 = _145.x;
        float _149 = _145.y;
        float _151 = _145.z;
        _137 = _147;
        _139 = _149;
        _141 = _151;
    }
    float _153 = _137;
    float _155 = _139;
    float _157 = _141;
    float _159 = in.m_38.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_38.y;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    if (_103)
    {
        float _171 = 0.0 + _127;
        float _173 = precise::clamp(_171, 0.0, 1.0);
        _131 = _173;
    }
    float _175 = _131;
    float _177 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = precise::min(_179, _183);
    float _187 = _59 * _163;
    float _189 = _59 * _169;
    int _192 = 0;
    float _194 = _179;
    float _196 = _187;
    float _198 = _189;
    if (_103)
    {
        float _200 = fma(_189, _175, _187);
        _192 = as_type<int>(_200);
    }
    int _202 = _192;
    if (_103)
    {
        float _204 = -_153;
        float _206 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].x, _204);
        _194 = _206;
    }
    float _208 = _194;
    if (_103)
    {
        float _210 = -_155;
        float _212 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[13].y, _210);
        _196 = _212;
    }
    float _214 = _196;
    if (_103)
    {
        float _216 = -_157;
        float _218 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[13].z, _216);
        _198 = _218;
    }
    float _220 = _198;
    int _222 = 0;
    if (_103)
    {
        float _224 = fma(_185, _208, _153);
        _222 = as_type<int>(_224);
    }
    int _226 = _222;
    int _228 = 0;
    if (_103)
    {
        float _230 = fma(_185, _214, _155);
        _228 = as_type<int>(_230);
    }
    int _232 = _228;
    int _234 = 0;
    if (_103)
    {
        float _236 = fma(_185, _220, _157);
        _234 = as_type<int>(_236);
    }
    int _238 = _234;
    if (_103)
    {
        out.m_36.x = as_type<float>(_226);
        out.m_36.y = as_type<float>(_232);
        out.m_36.z = as_type<float>(_238);
        out.m_36.w = as_type<float>(_202);
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
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _272 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_272, float2(0.0), isnan(_272))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_272, float2(0.0), isnan(_272))).x;
    float _67 = -_65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    bool _75 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_75)
    {
        discard_fragment();
    }
    float2 _304 = float2(_61, _63);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_304, float2(0.0), isnan(_304))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_304, float2(0.0), isnan(_304))).x;
    if (_75)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float _79 = in.m_38.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    float _89 = precise::max(_77, _87);
    float _91 = _59 * _83;
    float _93 = precise::max(_89, _91);
    bool _95 = _93 != 0.0;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.0);
    bool _103 = _99 || _101;
    float _105 = _87;
    float _107 = _83;
    if (_103)
    {
        _105 = 1.0;
    }
    float _109 = _105;
    float _111 = _109;
    if (_103)
    {
        float _113 = -_109;
        float _115 = _113 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _111 = _115;
    }
    float _117 = _111;
    if (_103)
    {
        float _119 = fma(_93, _117, 1.0);
        _107 = _119;
    }
    float _121 = _107;
    float _123 = _121;
    if (_103)
    {
        float _125 = log2(_121);
        _123 = _125;
    }
    float _127 = _123;
    float _129 = 0.0;
    float _131 = _127;
    if (_103)
    {
        float _133 = _127 + (-1.0);
        _129 = _133;
    }
    float _135 = _129;
    float _137 = _61;
    float _139 = _63;
    float _141 = 0.0;
    if (_103)
    {
        float2 _404 = float2(_61, _63);
        float3 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_404, float2(0.0), isnan(_404)), level(_135)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_404, float2(0.0), isnan(_404)), level(_135)).xyz;
        float _147 = _145.x;
        float _149 = _145.y;
        float _151 = _145.z;
        _137 = _147;
        _139 = _149;
        _141 = _151;
    }
    float _153 = _137;
    float _155 = _139;
    float _157 = _141;
    float _159 = in.m_38.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_38.y;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    if (_103)
    {
        float _171 = 0.0 + _127;
        float _173 = precise::clamp(_171, 0.0, 1.0);
        _131 = _173;
    }
    float _175 = _131;
    float _177 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = precise::min(_179, _183);
    float _187 = _59 * _163;
    float _189 = _59 * _169;
    int _192 = 0;
    float _194 = _179;
    float _196 = _187;
    float _198 = _189;
    if (_103)
    {
        float _200 = fma(_189, _175, _187);
        _192 = as_type<int>(_200);
    }
    int _202 = _192;
    if (_103)
    {
        float _204 = -_153;
        float _206 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].x, _204);
        _194 = _206;
    }
    float _208 = _194;
    if (_103)
    {
        float _210 = -_155;
        float _212 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[13].y, _210);
        _196 = _212;
    }
    float _214 = _196;
    if (_103)
    {
        float _216 = -_157;
        float _218 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[13].z, _216);
        _198 = _218;
    }
    float _220 = _198;
    int _222 = 0;
    if (_103)
    {
        float _224 = fma(_185, _208, _153);
        _222 = as_type<int>(_224);
    }
    int _226 = _222;
    int _228 = 0;
    if (_103)
    {
        float _230 = fma(_185, _214, _155);
        _228 = as_type<int>(_230);
    }
    int _232 = _228;
    int _234 = 0;
    if (_103)
    {
        float _236 = fma(_185, _220, _157);
        _234 = as_type<int>(_236);
    }
    int _238 = _234;
    if (_103)
    {
        out.m_36.x = as_type<float>(_226);
        out.m_36.y = as_type<float>(_232);
        out.m_36.z = as_type<float>(_238);
        out.m_36.w = as_type<float>(_202);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_36)};
}

