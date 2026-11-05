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
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    sampler fp_t_tcb_10Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = -(*spvDescriptorSet0.fp_c11)._m0[21].x;
    float _67 = _65 + (*spvDescriptorSet0.fp_c11)._m0[21].z;
    float _69 = 1.0 / _45;
    float _71 = _69 * _51;
    float _73 = -(*spvDescriptorSet0.fp_c11)._m0[21].y;
    float _75 = _73 + (*spvDescriptorSet0.fp_c11)._m0[21].w;
    float _77 = _69 * _57;
    float _79 = _69 * _63;
    float _81 = fma(_71, _67, (*spvDescriptorSet0.fp_c11)._m0[21].x);
    float _83 = fma(_71, _75, (*spvDescriptorSet0.fp_c11)._m0[21].y);
    float _85 = _77 + _81;
    float _87 = _79 + _83;
    float2 _255 = float2(_85, _87);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_255, float2(0.0), isnan(_255))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_255, float2(0.0), isnan(_255))).w;
    bool _93 = _89 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _101 = _97 || _99;
    if (!_101)
    {
        discard_fragment();
    }
    if (!_101)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    int _106 = _104 & 31;
    uint _109 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_106)));
    bool _111 = uint(_106) < 32u;
    int _113 = _111 ? int(_109) : 0;
    int _115 = _113 & 255;
    bool _117 = _115 != 255;
    bool _119 = !_117;
    if (!_119)
    {
        bool _121 = _115 != 0;
        if (!_121)
        {
            discard_fragment();
        }
        if (!_121)
        {
            out.m_38.x = 0.0;
            out.m_38.y = 0.0;
            out.m_38.z = 0.0;
            out.m_38.w = 0.0;
            return out;
        }
        float _123 = gl_FragCoord.x;
        float _125 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _127 = _123 / _125;
        float _129 = gl_FragCoord.y;
        float _131 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _133 = _129 / _131;
        float _135 = trunc(_127);
        float _137 = precise::max(_135, 0.0);
        uint _139 = uint(_137);
        float _141 = trunc(_133);
        float _143 = precise::max(_141, 0.0);
        uint _145 = uint(_143);
        uint _147 = uint(int(uint(int(_139)) >> uint(1)));
        uint _149 = uint(int(uint(int(_145)) >> uint(1)));
        int _151 = int(_147) ^ int(_149);
        int _153 = _151 * 65536;
        int _155 = _153 ^ int(_147);
        int _157 = 983055 & _155;
        int _159 = _157 << 6;
        int _161 = _159 + _157;
        int _163 = _161 & 13369548;
        uint _165 = uint(int(uint(_163) >> uint(3)));
        int _167 = _163 | int(_165);
        int _169 = _167 & 5570560;
        int _171 = _167 & 85;
        uint _173 = uint(int(uint(_169) >> uint(15)));
        int _175 = int(_173) + _171;
        bool _177 = uint(_115) >= uint(_175);
        if (!_177)
        {
            discard_fragment();
        }
        if (!_177)
        {
            out.m_38.x = 0.0;
            out.m_38.y = 0.0;
            out.m_38.z = 0.0;
            out.m_38.w = 0.0;
            return out;
        }
    }
    out.m_38.x = 1.0;
    out.m_38.y = 1.0;
    out.m_38.z = 1.0;
    out.m_38.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = -(*spvDescriptorSet0.fp_c11)._m0[21].x;
    float _67 = _65 + (*spvDescriptorSet0.fp_c11)._m0[21].z;
    float _69 = 1.0 / _45;
    float _71 = _69 * _51;
    float _73 = -(*spvDescriptorSet0.fp_c11)._m0[21].y;
    float _75 = _73 + (*spvDescriptorSet0.fp_c11)._m0[21].w;
    float _77 = _69 * _57;
    float _79 = _69 * _63;
    float _81 = fma(_71, _67, (*spvDescriptorSet0.fp_c11)._m0[21].x);
    float _83 = fma(_71, _75, (*spvDescriptorSet0.fp_c11)._m0[21].y);
    float _85 = _77 + _81;
    float _87 = _79 + _83;
    float2 _255 = float2(_85, _87);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_255, float2(0.0), isnan(_255))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_255, float2(0.0), isnan(_255))).w;
    bool _93 = _89 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _101 = _97 || _99;
    if (!_101)
    {
        discard_fragment();
    }
    if (!_101)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    int _106 = _104 & 31;
    uint _109 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_106)));
    bool _111 = uint(_106) < 32u;
    int _113 = _111 ? int(_109) : 0;
    int _115 = _113 & 255;
    bool _117 = _115 != 255;
    bool _119 = !_117;
    if (!_119)
    {
        bool _121 = _115 != 0;
        if (!_121)
        {
            discard_fragment();
        }
        if (!_121)
        {
            out.m_38.x = 0.0;
            out.m_38.y = 0.0;
            out.m_38.z = 0.0;
            out.m_38.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_38)};
        }
        float _123 = gl_FragCoord.x;
        float _125 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _127 = _123 / _125;
        float _129 = gl_FragCoord.y;
        float _131 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _133 = _129 / _131;
        float _135 = trunc(_127);
        float _137 = precise::max(_135, 0.0);
        uint _139 = uint(_137);
        float _141 = trunc(_133);
        float _143 = precise::max(_141, 0.0);
        uint _145 = uint(_143);
        uint _147 = uint(int(uint(int(_139)) >> uint(1)));
        uint _149 = uint(int(uint(int(_145)) >> uint(1)));
        int _151 = int(_147) ^ int(_149);
        int _153 = _151 * 65536;
        int _155 = _153 ^ int(_147);
        int _157 = 983055 & _155;
        int _159 = _157 << 6;
        int _161 = _159 + _157;
        int _163 = _161 & 13369548;
        uint _165 = uint(int(uint(_163) >> uint(3)));
        int _167 = _163 | int(_165);
        int _169 = _167 & 5570560;
        int _171 = _167 & 85;
        uint _173 = uint(int(uint(_169) >> uint(15)));
        int _175 = int(_173) + _171;
        bool _177 = uint(_115) >= uint(_175);
        if (!_177)
        {
            discard_fragment();
        }
        if (!_177)
        {
            out.m_38.x = 0.0;
            out.m_38.y = 0.0;
            out.m_38.z = 0.0;
            out.m_38.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_38)};
        }
    }
    out.m_38.x = 1.0;
    out.m_38.y = 1.0;
    out.m_38.z = 1.0;
    out.m_38.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

