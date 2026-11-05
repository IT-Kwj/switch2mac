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

constant spvUnsafeArray<int2, 4> _279 = spvUnsafeArray<int2, 4>({ int2(-2, 0), int2(0, -2), int2(0), int2(0) });
constant spvUnsafeArray<int2, 4> _299 = spvUnsafeArray<int2, 4>({ int2(-1, 0), int2(0, -1), int2(1, 0), int2(0, 1) });

struct main0_out
{
    float4 m_35 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_29.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_29.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = 1.0 / _42;
    float _58 = _56 * _48;
    float _60 = _56 * _54;
    float2 _266 = float2(_58, _60);
    float3 _64 = spvGatherConstOffsets(spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr, _279, component::x, select(_266, float2(0.0), isnan(_266))).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _291 = float2(_58, _60);
    float4 _73 = spvGatherConstOffsets(spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr, _299, component::x, select(_291, float2(0.0), isnan(_291))).xyzw;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = _73.z;
    float _81 = _73.w;
    float _83 = -_70;
    float _85 = _79 + _83;
    float _87 = -_70;
    float _89 = _81 + _87;
    float _91 = -_70;
    float _93 = _77 + _91;
    float _95 = -_70;
    float _97 = _75 + _95;
    float _99 = -_75;
    float _101 = _99 + _66;
    float _103 = -_77;
    float _105 = _103 + _68;
    float _107 = abs(_93);
    float _109 = _107 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _111 = abs(_93);
    float _113 = abs(_89);
    float _115 = precise::max(_111, _113);
    float _117 = abs(_97);
    float _119 = _117 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _121 = abs(_97);
    float _123 = abs(_85);
    float _125 = precise::max(_121, _123);
    float _127 = abs(_105);
    float _129 = precise::max(_127, _115);
    float _131 = abs(_101);
    float _133 = precise::max(_131, _125);
    float _135 = abs(_93);
    bool _139 = _135 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _141 = isnan(_135);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _147 = _143 || _145;
    float _149 = float(_147);
    float _151 = abs(_97);
    bool _153 = _151 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _155 = isnan(_151);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = precise::max(_133, _129);
    float _167 = abs(_85);
    bool _169 = _167 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _171 = isnan(_167);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _177 = _173 || _175;
    float _179 = float(_177);
    float _181 = _163 + _149;
    bool _183 = _119 >= _165;
    bool _185 = isnan(_119);
    bool _187 = _183 || _185;
    bool _189 = isnan(_165);
    bool _191 = _187 || _189;
    float _193 = float(_191);
    bool _195 = _109 >= _165;
    bool _197 = isnan(_109);
    bool _199 = _195 || _197;
    bool _201 = isnan(_165);
    bool _203 = _199 || _201;
    float _205 = float(_203);
    float _207 = _179 + _181;
    float _209 = abs(_89);
    bool _211 = _209 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _213 = isnan(_209);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = _163 * _193;
    float _225 = _149 * _205;
    float _227 = -_221;
    bool _229 = _207 == _227;
    int _232 = _229 ? 1065353216 : 0;
    out.gl_FragDepth = as_type<float>(_232);
    out.m_35.x = _223;
    out.m_35.y = _225;
    out.m_35.z = _223;
    out.m_35.w = _225;
    return out;
}

