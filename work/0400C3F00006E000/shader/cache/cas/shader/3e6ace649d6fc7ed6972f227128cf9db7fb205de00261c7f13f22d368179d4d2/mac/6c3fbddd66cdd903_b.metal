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
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    texture2d_array<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    sampler fp_t_tcb_10Smplr_w [[id(6)]];
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
    float _45 = in.m_33.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = rint((*spvDescriptorSet0.fp_c7)._m0[9].w);
    float _59 = precise::max(_57, 0.0);
    uint _62 = uint(_59);
    uint _64 = clamp(_62, 0u, 65535u);
    float _66 = 1.0 / _43;
    float _68 = _66 * _49;
    float _70 = _66 * _55;
    float3 _213 = float3(_70, _68, float(int(_64)));
    float3 _217 = select(_213, float3(0.0), isnan(_213));
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _217.xy, uint(rint(_217.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _217.xy, uint(rint(_217.z))).w;
    bool _76 = _72 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _78 = isnan(_72);
    bool _80 = _76 || _78;
    bool _82 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _84 = _80 || _82;
    if (!_84)
    {
        discard_fragment();
    }
    if (!_84)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    int _87 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    int _89 = _87 & 31;
    uint _91 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_89)));
    bool _93 = uint(_89) < 32u;
    int _95 = _93 ? int(_91) : 0;
    int _97 = _95 & 255;
    bool _99 = _97 != 255;
    bool _101 = !_99;
    if (!_101)
    {
        bool _103 = _97 != 0;
        if (!_103)
        {
            discard_fragment();
        }
        if (!_103)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return out;
        }
        float _105 = gl_FragCoord.x;
        float _107 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _109 = _105 / _107;
        float _111 = gl_FragCoord.y;
        float _113 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _115 = _111 / _113;
        float _117 = trunc(_109);
        float _119 = precise::max(_117, 0.0);
        uint _121 = uint(_119);
        float _123 = trunc(_115);
        float _125 = precise::max(_123, 0.0);
        uint _127 = uint(_125);
        int _129 = int(_121) + 2;
        uint _131 = uint(int(uint(_129) >> uint(1)));
        uint _133 = uint(int(uint(int(_127)) >> uint(1)));
        int _135 = int(_131) ^ int(_133);
        int _137 = _135 * 65536;
        int _139 = _137 ^ int(_131);
        int _141 = 983055 & _139;
        int _143 = _141 * 64;
        int _145 = _143 + _141;
        int _147 = _145 & 13369548;
        uint _149 = uint(int(uint(_147) >> uint(3)));
        int _151 = _147 | int(_149);
        int _153 = _151 & 5570560;
        int _155 = _151 & 85;
        uint _157 = uint(int(uint(_153) >> uint(15)));
        int _159 = int(_157) + _155;
        bool _161 = uint(_97) >= uint(_159);
        if (!_161)
        {
            discard_fragment();
        }
        if (!_161)
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
    float _45 = in.m_33.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = rint((*spvDescriptorSet0.fp_c7)._m0[9].w);
    float _59 = precise::max(_57, 0.0);
    uint _62 = uint(_59);
    uint _64 = clamp(_62, 0u, 65535u);
    float _66 = 1.0 / _43;
    float _68 = _66 * _49;
    float _70 = _66 * _55;
    float3 _213 = float3(_70, _68, float(int(_64)));
    float3 _217 = select(_213, float3(0.0), isnan(_213));
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _217.xy, uint(rint(_217.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _217.xy, uint(rint(_217.z))).w;
    bool _76 = _72 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _78 = isnan(_72);
    bool _80 = _76 || _78;
    bool _82 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _84 = _80 || _82;
    if (!_84)
    {
        discard_fragment();
    }
    if (!_84)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    int _87 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    int _89 = _87 & 31;
    uint _91 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_89)));
    bool _93 = uint(_89) < 32u;
    int _95 = _93 ? int(_91) : 0;
    int _97 = _95 & 255;
    bool _99 = _97 != 255;
    bool _101 = !_99;
    if (!_101)
    {
        bool _103 = _97 != 0;
        if (!_103)
        {
            discard_fragment();
        }
        if (!_103)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_36)};
        }
        float _105 = gl_FragCoord.x;
        float _107 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _109 = _105 / _107;
        float _111 = gl_FragCoord.y;
        float _113 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _115 = _111 / _113;
        float _117 = trunc(_109);
        float _119 = precise::max(_117, 0.0);
        uint _121 = uint(_119);
        float _123 = trunc(_115);
        float _125 = precise::max(_123, 0.0);
        uint _127 = uint(_125);
        int _129 = int(_121) + 2;
        uint _131 = uint(int(uint(_129) >> uint(1)));
        uint _133 = uint(int(uint(int(_127)) >> uint(1)));
        int _135 = int(_131) ^ int(_133);
        int _137 = _135 * 65536;
        int _139 = _137 ^ int(_131);
        int _141 = 983055 & _139;
        int _143 = _141 * 64;
        int _145 = _143 + _141;
        int _147 = _145 & 13369548;
        uint _149 = uint(int(uint(_147) >> uint(3)));
        int _151 = _147 | int(_149);
        int _153 = _151 & 5570560;
        int _155 = _151 & 85;
        uint _157 = uint(int(uint(_153) >> uint(15)));
        int _159 = int(_157) + _155;
        bool _161 = uint(_97) >= uint(_159);
        if (!_161)
        {
            discard_fragment();
        }
        if (!_161)
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

