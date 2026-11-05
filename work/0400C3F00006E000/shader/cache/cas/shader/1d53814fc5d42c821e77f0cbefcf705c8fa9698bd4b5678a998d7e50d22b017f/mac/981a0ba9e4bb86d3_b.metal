#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x));
    int _52 = -as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    float _54 = 1.0 / _49;
    int _56 = as_type<int>(_54) + (-2);
    float _58 = 1.0 / _41;
    float _60 = _58 * _47;
    int _62 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y));
    float _64 = float(uint(_62));
    float _66 = trunc(_60);
    int _68 = int(_66);
    float _70 = 1.0 / _64;
    float _72 = float(uint(_68));
    int _74 = abs(_68);
    float _76 = as_type<float>(_56) * _72;
    float _78 = float(uint(_74));
    int _80 = as_type<int>(_70) + (-2);
    float _82 = trunc(_76);
    float _84 = precise::max(_82, 0.0);
    uint _87 = uint(_84);
    int _89 = -_62;
    float _91 = as_type<float>(_80) * _78;
    float _93 = in.m_31.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = trunc(_91);
    float _101 = precise::max(_99, 0.0);
    uint _103 = uint(_101);
    int _105 = _52 * int(_87);
    int _107 = _105 + _68;
    float _109 = float(uint(_107));
    float _111 = as_type<float>(_56) * _109;
    int _113 = _89 * int(_103);
    int _115 = _113 + _74;
    float _117 = trunc(_111);
    float _119 = precise::max(_117, 0.0);
    uint _121 = uint(_119);
    float _123 = float(uint(_115));
    int _125 = -as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    float _127 = as_type<float>(_80) * _123;
    float _129 = trunc(_127);
    float _131 = precise::max(_129, 0.0);
    uint _133 = uint(_131);
    int _135 = int(_87) + int(_121);
    int _137 = -_62;
    int _139 = _125 * _135;
    int _141 = _139 + _68;
    bool _145 = uint(_141) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    int _147 = int(_103) + int(_133);
    float _149 = in.m_31.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_31.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_31.y;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    bool _167 = !_145;
    int _169 = _167 ? 0 : (-1);
    int _171 = _137 * _147;
    int _173 = _171 + _74;
    bool _175 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    int _177 = -_135;
    int _179 = _169 + _177;
    bool _181 = uint(_173) >= uint(_62);
    float _183 = _58 * _97;
    int _185 = _179 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    int _187 = _185 + _68;
    int _189 = _68 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _191 = 1.0 / _183;
    bool _193 = !_181;
    int _195 = _193 ? 0 : (-1);
    uint _197 = uint(int(uint(_189) >> uint(31)));
    bool _199 = !_175;
    int _201 = _199 ? _187 : (-1);
    int _203 = ~_195;
    int _205 = _147 + _203;
    int _207 = _205 + 1;
    int _209 = -int(_197);
    float _211 = float(_201);
    bool _213 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y) == 0;
    int _215 = _207 ^ _209;
    float _217 = rint(_211);
    float _219 = precise::max(_217, 0.0);
    uint _221 = uint(_219);
    uint _223 = clamp(_221, 0u, 65535u);
    int _225 = ~_209;
    int _227 = _225 + _215;
    int _229 = _227 + 1;
    float _231 = _58 * _153;
    float _233 = _58 * _159;
    float _235 = _58 * _165;
    bool _237 = !_213;
    int _239 = _237 ? _229 : (-1);
    float _241 = _231 * _191;
    float _243 = _233 * _191;
    float _245 = _235 * _191;
    float _247 = float(_239);
    float3 _555 = float3(_241, _245, float(int(_223)));
    float3 _559 = select(_555, float3(0.0), isnan(_555));
    float _249 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _559.xy, uint(rint(_559.z)), _243, level(_247));
    float _251 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[30].x, (*spvDescriptorSet0.fp_c3)._m0[30].y);
    out.m_34.x = _251;
    out.m_34.w = (*spvDescriptorSet0.fp_c3)._m0[8].x;
    return out;
}

