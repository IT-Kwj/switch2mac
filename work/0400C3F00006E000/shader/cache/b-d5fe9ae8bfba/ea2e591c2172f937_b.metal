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

constant spvUnsafeArray<int2, 4> _281 = spvUnsafeArray<int2, 4>({ int2(-2, 0), int2(0, -2), int2(0), int2(0) });
constant spvUnsafeArray<int2, 4> _301 = spvUnsafeArray<int2, 4>({ int2(-1, 0), int2(0, -1), int2(1, 0), int2(0, 1) });

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
    float2 _268 = float2(_55, _57);
    float3 _61 = spvGatherConstOffsets(spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr, _281, component::x, select(_268, float2(0.0), isnan(_268))).xyw;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _293 = float2(_55, _57);
    float4 _70 = spvGatherConstOffsets(spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr, _301, component::x, select(_293, float2(0.0), isnan(_293))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = -_67;
    float _82 = _72 + _80;
    float _84 = -_67;
    float _86 = _74 + _84;
    float _88 = -_67;
    float _90 = _76 + _88;
    float _92 = -_67;
    float _94 = _78 + _92;
    float _96 = abs(_82);
    bool _100 = _96 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _102 = isnan(_96);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _108 = _104 || _106;
    float _110 = float(_108);
    float _112 = abs(_86);
    bool _114 = _112 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _122 = _118 || _120;
    float _124 = float(_122);
    float _126 = abs(_90);
    bool _128 = _126 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _136 = _132 || _134;
    float _138 = float(_136);
    float _140 = _110 + _124;
    float _142 = _138 + _140;
    float _144 = abs(_94);
    bool _146 = _144 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _154 = _150 || _152;
    float _156 = float(_154);
    float _158 = -_156;
    bool _160 = _142 != _158;
    bool _162 = isnan(_142);
    bool _164 = _160 || _162;
    bool _166 = isnan(_158);
    bool _168 = _164 || _166;
    float _170 = -_72;
    float _172 = _170 + _63;
    float _174 = -_74;
    float _176 = _174 + _65;
    if (!_168)
    {
        discard_fragment();
    }
    if (!_168)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    float _178 = abs(_82);
    float _180 = abs(_90);
    float _182 = precise::max(_178, _180);
    float _184 = abs(_82);
    float _186 = _184 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _188 = abs(_86);
    float _190 = abs(_94);
    float _192 = precise::max(_188, _190);
    float _194 = abs(_86);
    float _196 = _194 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _198 = abs(_172);
    float _200 = precise::max(_198, _182);
    float _202 = abs(_176);
    float _204 = precise::max(_202, _192);
    float _206 = precise::max(_200, _204);
    bool _208 = _186 >= _206;
    bool _210 = isnan(_186);
    bool _212 = _208 || _210;
    bool _214 = isnan(_206);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    bool _220 = _196 >= _206;
    bool _222 = isnan(_196);
    bool _224 = _220 || _222;
    bool _226 = isnan(_206);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = _110 * _218;
    float _234 = _124 * _230;
    out.m_32.x = _232;
    out.m_32.y = _234;
    out.m_32.z = _232;
    out.m_32.w = _234;
    return out;
}

