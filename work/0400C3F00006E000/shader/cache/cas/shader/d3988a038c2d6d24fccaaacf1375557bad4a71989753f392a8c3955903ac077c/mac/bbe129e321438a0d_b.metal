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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c11 [[id(2)]];
    constant _16* fp_c7 [[id(3)]];
    texture2d<float> fp_t_tcb_16 [[id(4)]];
    sampler fp_t_tcb_16Smplr [[id(5)]];
    sampler fp_t_tcb_16Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
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
    float2 _187 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_187, float2(0.0), isnan(_187))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_187, float2(0.0), isnan(_187))).w;
    bool _67 = _63 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _69 = isnan(_63);
    bool _71 = _67 || _69;
    bool _73 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _75 = _71 || _73;
    if (!_75)
    {
        discard_fragment();
    }
    if (!_75)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    int _78 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    int _80 = _78 & 31;
    uint _83 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_80)));
    bool _85 = uint(_80) < 32u;
    int _87 = _85 ? int(_83) : 0;
    int _89 = _87 & 255;
    bool _91 = _89 != 255;
    bool _93 = !_91;
    if (!_93)
    {
        bool _95 = _89 != 0;
        if (!_95)
        {
            discard_fragment();
        }
        if (!_95)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return out;
        }
        float _97 = gl_FragCoord.x;
        float _99 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _101 = _97 / _99;
        float _103 = gl_FragCoord.y;
        float _105 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _107 = _103 / _105;
        float _109 = trunc(_101);
        float _111 = precise::max(_109, 0.0);
        uint _113 = uint(_111);
        float _115 = trunc(_107);
        float _117 = precise::max(_115, 0.0);
        uint _119 = uint(_117);
        int _121 = int(_113) + 2;
        uint _123 = uint(int(uint(_121) >> uint(1)));
        uint _125 = uint(int(uint(int(_119)) >> uint(1)));
        int _127 = int(_123) ^ int(_125);
        int _129 = _127 * 65536;
        int _131 = _129 ^ int(_123);
        int _133 = 983055 & _131;
        int _135 = _133 * 64;
        int _137 = _135 + _133;
        int _139 = _137 & 13369548;
        uint _141 = uint(int(uint(_139) >> uint(3)));
        int _143 = _139 | int(_141);
        int _145 = _143 & 5570560;
        int _147 = _143 & 85;
        uint _149 = uint(int(uint(_145) >> uint(15)));
        int _151 = int(_149) + _147;
        bool _153 = uint(_89) >= uint(_151);
        if (!_153)
        {
            discard_fragment();
        }
        if (!_153)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return out;
        }
    }
    out.m_36.x = 1.0;
    out.m_36.y = 1.0;
    out.m_36.z = 1.0;
    out.m_36.w = 1.0;
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
    float2 _187 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_187, float2(0.0), isnan(_187))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_187, float2(0.0), isnan(_187))).w;
    bool _67 = _63 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _69 = isnan(_63);
    bool _71 = _67 || _69;
    bool _73 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _75 = _71 || _73;
    if (!_75)
    {
        discard_fragment();
    }
    if (!_75)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    int _78 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    int _80 = _78 & 31;
    uint _83 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_80)));
    bool _85 = uint(_80) < 32u;
    int _87 = _85 ? int(_83) : 0;
    int _89 = _87 & 255;
    bool _91 = _89 != 255;
    bool _93 = !_91;
    if (!_93)
    {
        bool _95 = _89 != 0;
        if (!_95)
        {
            discard_fragment();
        }
        if (!_95)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_36)};
        }
        float _97 = gl_FragCoord.x;
        float _99 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _101 = _97 / _99;
        float _103 = gl_FragCoord.y;
        float _105 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _107 = _103 / _105;
        float _109 = trunc(_101);
        float _111 = precise::max(_109, 0.0);
        uint _113 = uint(_111);
        float _115 = trunc(_107);
        float _117 = precise::max(_115, 0.0);
        uint _119 = uint(_117);
        int _121 = int(_113) + 2;
        uint _123 = uint(int(uint(_121) >> uint(1)));
        uint _125 = uint(int(uint(int(_119)) >> uint(1)));
        int _127 = int(_123) ^ int(_125);
        int _129 = _127 * 65536;
        int _131 = _129 ^ int(_123);
        int _133 = 983055 & _131;
        int _135 = _133 * 64;
        int _137 = _135 + _133;
        int _139 = _137 & 13369548;
        uint _141 = uint(int(uint(_139) >> uint(3)));
        int _143 = _139 | int(_141);
        int _145 = _143 & 5570560;
        int _147 = _143 & 85;
        uint _149 = uint(int(uint(_145) >> uint(15)));
        int _151 = int(_149) + _147;
        bool _153 = uint(_89) >= uint(_151);
        if (!_153)
        {
            discard_fragment();
        }
        if (!_153)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_36)};
        }
    }
    out.m_36.x = 1.0;
    out.m_36.y = 1.0;
    out.m_36.z = 1.0;
    out.m_36.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

