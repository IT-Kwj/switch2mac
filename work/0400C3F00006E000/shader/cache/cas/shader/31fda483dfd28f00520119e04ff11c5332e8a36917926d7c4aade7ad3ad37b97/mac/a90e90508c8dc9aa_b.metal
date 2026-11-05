#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

template<typename Tex, typename... Tp>
using spvGatherReturn = decltype(declval<Tex>().gather(declval<sampler>(), declval<Tp>()...));

// Wrapper function that processes a device texture gather with a constant offset array.
template<typename Tex, typename Toff, typename... Tp>
inline spvGatherReturn<Tex, Tp...> spvGatherConstOffsets(const device Tex& t, sampler s, Toff coffsets, component c, Tp... params) METAL_CONST_ARG(c)
{
    spvGatherReturn<Tex, Tp...> rslts[4];
    for (uint i = 0; i < 4; i++)
    {
        switch (c)
        {
            case component::x:
                rslts[i] = t.gather(s, params..., coffsets[i], component::x);
                break;
            case component::y:
                rslts[i] = t.gather(s, params..., coffsets[i], component::y);
                break;
            case component::z:
                rslts[i] = t.gather(s, params..., coffsets[i], component::z);
                break;
            case component::w:
                rslts[i] = t.gather(s, params..., coffsets[i], component::w);
                break;
        }
    }
    return spvGatherReturn<Tex, Tp...>(rslts[0].w, rslts[1].w, rslts[2].w, rslts[3].w);
}

// Wrapper function that processes a constant texture gather with a constant offset array.
template<typename Tex, typename Toff, typename... Tp>
inline spvGatherReturn<Tex, Tp...> spvGatherConstOffsets(const constant Tex& t, sampler s, Toff coffsets, component c, Tp... params) METAL_CONST_ARG(c)
{
    spvGatherReturn<Tex, Tp...> rslts[4];
    for (uint i = 0; i < 4; i++)
    {
        switch (c)
        {
            case component::x:
                rslts[i] = t.gather(s, params..., coffsets[i], component::x);
                break;
            case component::y:
                rslts[i] = t.gather(s, params..., coffsets[i], component::y);
                break;
            case component::z:
                rslts[i] = t.gather(s, params..., coffsets[i], component::z);
                break;
            case component::w:
                rslts[i] = t.gather(s, params..., coffsets[i], component::w);
                break;
        }
    }
    return spvGatherReturn<Tex, Tp...>(rslts[0].w, rslts[1].w, rslts[2].w, rslts[3].w);
}

// Wrapper function that processes a thread texture gather with a constant offset array.
template<typename Tex, typename Toff, typename... Tp>
inline spvGatherReturn<Tex, Tp...> spvGatherConstOffsets(const thread Tex& t, sampler s, Toff coffsets, component c, Tp... params) METAL_CONST_ARG(c)
{
    spvGatherReturn<Tex, Tp...> rslts[4];
    for (uint i = 0; i < 4; i++)
    {
        switch (c)
        {
            case component::x:
                rslts[i] = t.gather(s, params..., coffsets[i], component::x);
                break;
            case component::y:
                rslts[i] = t.gather(s, params..., coffsets[i], component::y);
                break;
            case component::z:
                rslts[i] = t.gather(s, params..., coffsets[i], component::z);
                break;
            case component::w:
                rslts[i] = t.gather(s, params..., coffsets[i], component::w);
                break;
        }
    }
    return spvGatherReturn<Tex, Tp...>(rslts[0].w, rslts[1].w, rslts[2].w, rslts[3].w);
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
};

constant spvUnsafeArray<int2, 4> _234 = spvUnsafeArray<int2, 4>({ int2(-2, 0), int2(0, -2), int2(0), int2(0) });
constant spvUnsafeArray<int2, 4> _254 = spvUnsafeArray<int2, 4>({ int2(-1, 0), int2(0, -1), int2(1, 0), int2(0, 1) });

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _221 = float2(_55, _57);
    float3 _61 = spvGatherConstOffsets(spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr, _234, component::x, select(_221, float2(0.0), isnan(_221))).xyw;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _246 = float2(_55, _57);
    float4 _70 = spvGatherConstOffsets(spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr, _254, component::x, select(_246, float2(0.0), isnan(_246))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = -_67;
    float _82 = _76 + _80;
    float _84 = -_67;
    float _86 = _78 + _84;
    float _88 = -_67;
    float _90 = _72 + _88;
    float _92 = -_67;
    float _94 = _74 + _92;
    float _96 = -_72;
    float _98 = _96 + _63;
    float _100 = -_74;
    float _102 = _100 + _65;
    float _104 = abs(_90);
    float _106 = _104 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _108 = abs(_90);
    float _110 = abs(_82);
    float _112 = precise::max(_108, _110);
    float _114 = abs(_94);
    float _116 = _114 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _118 = abs(_94);
    float _120 = abs(_86);
    float _122 = precise::max(_118, _120);
    float _124 = abs(_98);
    float _126 = precise::max(_124, _112);
    float _128 = abs(_102);
    float _130 = precise::max(_128, _122);
    float _132 = precise::max(_126, _130);
    bool _136 = _116 >= _132;
    bool _138 = isnan(_116);
    bool _140 = _136 || _138;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = _106 >= _132;
    bool _148 = isnan(_106);
    bool _150 = _146 || _148;
    bool _152 = isnan(_132);
    bool _154 = _150 || _152;
    float _156 = abs(_94);
    bool _158 = _156 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _160 = isnan(_156);
    bool _162 = _158 || _160;
    bool _164 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _166 = _162 || _164;
    bool _168 = _166 && _144;
    int _171 = _168 ? 1065353216 : 0;
    float _173 = abs(_90);
    bool _175 = _173 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _177 = isnan(_173);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _183 = _179 || _181;
    bool _185 = _183 && _154;
    int _187 = _185 ? 1065353216 : 0;
    out.m_32.x = as_type<float>(_187);
    out.m_32.y = as_type<float>(_171);
    out.m_32.z = as_type<float>(_187);
    out.m_32.w = as_type<float>(_171);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _221 = float2(_55, _57);
    float3 _61 = spvGatherConstOffsets(spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr, _234, component::x, select(_221, float2(0.0), isnan(_221))).xyw;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _246 = float2(_55, _57);
    float4 _70 = spvGatherConstOffsets(spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr, _254, component::x, select(_246, float2(0.0), isnan(_246))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = -_67;
    float _82 = _76 + _80;
    float _84 = -_67;
    float _86 = _78 + _84;
    float _88 = -_67;
    float _90 = _72 + _88;
    float _92 = -_67;
    float _94 = _74 + _92;
    float _96 = -_72;
    float _98 = _96 + _63;
    float _100 = -_74;
    float _102 = _100 + _65;
    float _104 = abs(_90);
    float _106 = _104 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _108 = abs(_90);
    float _110 = abs(_82);
    float _112 = precise::max(_108, _110);
    float _114 = abs(_94);
    float _116 = _114 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _118 = abs(_94);
    float _120 = abs(_86);
    float _122 = precise::max(_118, _120);
    float _124 = abs(_98);
    float _126 = precise::max(_124, _112);
    float _128 = abs(_102);
    float _130 = precise::max(_128, _122);
    float _132 = precise::max(_126, _130);
    bool _136 = _116 >= _132;
    bool _138 = isnan(_116);
    bool _140 = _136 || _138;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = _106 >= _132;
    bool _148 = isnan(_106);
    bool _150 = _146 || _148;
    bool _152 = isnan(_132);
    bool _154 = _150 || _152;
    float _156 = abs(_94);
    bool _158 = _156 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _160 = isnan(_156);
    bool _162 = _158 || _160;
    bool _164 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _166 = _162 || _164;
    bool _168 = _166 && _144;
    int _171 = _168 ? 1065353216 : 0;
    float _173 = abs(_90);
    bool _175 = _173 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _177 = isnan(_173);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _183 = _179 || _181;
    bool _185 = _183 && _154;
    int _187 = _185 ? 1065353216 : 0;
    out.m_32.x = as_type<float>(_187);
    out.m_32.y = as_type<float>(_171);
    out.m_32.z = as_type<float>(_187);
    out.m_32.w = as_type<float>(_171);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

