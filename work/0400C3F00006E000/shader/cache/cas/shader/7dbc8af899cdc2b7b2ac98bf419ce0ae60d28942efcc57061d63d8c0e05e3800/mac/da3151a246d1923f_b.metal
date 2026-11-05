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
    constant _16* fp_c11 [[id(1)]];
    texture2d_array<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_29 [[user(locn2), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.z;
    float _47 = in.m_31.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _43;
    float _61 = float(as_type<uint>(_45));
    float _63 = rint(_61);
    float _65 = precise::max(_63, 0.0);
    uint _68 = uint(_65);
    uint _70 = clamp(_68, 0u, 65535u);
    float _72 = _59 * _51;
    float _74 = _59 * _57;
    float3 _232 = float3(_74, _72, float(int(_70)));
    float3 _236 = select(_232, float3(0.0), isnan(_232));
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _236.xy, uint(rint(_236.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _236.xy, uint(rint(_236.z))).w;
    bool _80 = _76 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _82 = isnan(_76);
    bool _84 = _80 || _82;
    bool _86 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _88 = _84 || _86;
    if (!_88)
    {
        discard_fragment();
    }
    if (!_88)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _90 = in.m_36.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = _59 * _94;
    float _98 = _96 * 1.0499999523162841796875;
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = _100 * 256.0;
    float _104 = trunc(_102);
    float _106 = precise::max(_104, 0.0);
    uint _108 = uint(_106);
    int _111 = int(_108) * 255;
    uint _113 = uint(int(uint(_111) >> uint(8)));
    bool _115 = int(_113) != 255;
    bool _117 = !_115;
    if (!_117)
    {
        bool _119 = int(_113) != 0;
        if (!_119)
        {
            discard_fragment();
        }
        if (!_119)
        {
            out.m_34.x = 0.0;
            out.m_34.y = 0.0;
            out.m_34.z = 0.0;
            out.m_34.w = 0.0;
            return out;
        }
        float _121 = gl_FragCoord.x;
        float _123 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _125 = _121 / _123;
        float _127 = gl_FragCoord.y;
        float _129 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _131 = _127 / _129;
        float _133 = trunc(_125);
        float _135 = precise::max(_133, 0.0);
        uint _137 = uint(_135);
        float _139 = trunc(_131);
        float _141 = precise::max(_139, 0.0);
        uint _143 = uint(_141);
        int _145 = int(_137) + 2;
        uint _147 = uint(int(uint(_145) >> uint(1)));
        uint _149 = uint(int(uint(int(_143)) >> uint(1)));
        int _151 = int(_147) ^ int(_149);
        int _153 = _151 * 65536;
        int _155 = _153 ^ int(_147);
        int _157 = 983055 & _155;
        int _159 = _157 * 64;
        int _161 = _159 + _157;
        int _163 = _161 & 13369548;
        uint _165 = uint(int(uint(_163) >> uint(3)));
        int _167 = _163 | int(_165);
        int _169 = _167 & 5570560;
        int _171 = _167 & 85;
        uint _173 = uint(int(uint(_169) >> uint(15)));
        int _175 = int(_173) + _171;
        bool _177 = _113 >= uint(_175);
        if (!_177)
        {
            discard_fragment();
        }
        if (!_177)
        {
            out.m_34.x = 0.0;
            out.m_34.y = 0.0;
            out.m_34.z = 0.0;
            out.m_34.w = 0.0;
            return out;
        }
    }
    out.m_34.x = 1.0;
    out.m_34.y = 1.0;
    out.m_34.z = 1.0;
    out.m_34.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.z;
    float _47 = in.m_31.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _43;
    float _61 = float(as_type<uint>(_45));
    float _63 = rint(_61);
    float _65 = precise::max(_63, 0.0);
    uint _68 = uint(_65);
    uint _70 = clamp(_68, 0u, 65535u);
    float _72 = _59 * _51;
    float _74 = _59 * _57;
    float3 _232 = float3(_74, _72, float(int(_70)));
    float3 _236 = select(_232, float3(0.0), isnan(_232));
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _236.xy, uint(rint(_236.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _236.xy, uint(rint(_236.z))).w;
    bool _80 = _76 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _82 = isnan(_76);
    bool _84 = _80 || _82;
    bool _86 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _88 = _84 || _86;
    if (!_88)
    {
        discard_fragment();
    }
    if (!_88)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    float _90 = in.m_36.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = _59 * _94;
    float _98 = _96 * 1.0499999523162841796875;
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = _100 * 256.0;
    float _104 = trunc(_102);
    float _106 = precise::max(_104, 0.0);
    uint _108 = uint(_106);
    int _111 = int(_108) * 255;
    uint _113 = uint(int(uint(_111) >> uint(8)));
    bool _115 = int(_113) != 255;
    bool _117 = !_115;
    if (!_117)
    {
        bool _119 = int(_113) != 0;
        if (!_119)
        {
            discard_fragment();
        }
        if (!_119)
        {
            out.m_34.x = 0.0;
            out.m_34.y = 0.0;
            out.m_34.z = 0.0;
            out.m_34.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_34)};
        }
        float _121 = gl_FragCoord.x;
        float _123 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _125 = _121 / _123;
        float _127 = gl_FragCoord.y;
        float _129 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _131 = _127 / _129;
        float _133 = trunc(_125);
        float _135 = precise::max(_133, 0.0);
        uint _137 = uint(_135);
        float _139 = trunc(_131);
        float _141 = precise::max(_139, 0.0);
        uint _143 = uint(_141);
        int _145 = int(_137) + 2;
        uint _147 = uint(int(uint(_145) >> uint(1)));
        uint _149 = uint(int(uint(int(_143)) >> uint(1)));
        int _151 = int(_147) ^ int(_149);
        int _153 = _151 * 65536;
        int _155 = _153 ^ int(_147);
        int _157 = 983055 & _155;
        int _159 = _157 * 64;
        int _161 = _159 + _157;
        int _163 = _161 & 13369548;
        uint _165 = uint(int(uint(_163) >> uint(3)));
        int _167 = _163 | int(_165);
        int _169 = _167 & 5570560;
        int _171 = _167 & 85;
        uint _173 = uint(int(uint(_169) >> uint(15)));
        int _175 = int(_173) + _171;
        bool _177 = _113 >= uint(_175);
        if (!_177)
        {
            discard_fragment();
        }
        if (!_177)
        {
            out.m_34.x = 0.0;
            out.m_34.y = 0.0;
            out.m_34.z = 0.0;
            out.m_34.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_34)};
        }
    }
    out.m_34.x = 1.0;
    out.m_34.y = 1.0;
    out.m_34.z = 1.0;
    out.m_34.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_34)};
}

