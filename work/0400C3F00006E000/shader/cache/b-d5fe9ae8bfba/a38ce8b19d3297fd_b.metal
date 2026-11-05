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
    float _49 = in.m_31.z;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x));
    float _57 = 1.0 / _55;
    int _60 = as_type<int>(_57) + (-2);
    int _62 = -as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    float _64 = 1.0 / _41;
    float _66 = _64 * _47;
    int _68 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y));
    float _70 = _64 * _53;
    float _72 = float(uint(_68));
    float _74 = trunc(_66);
    int _76 = int(_74);
    float _78 = 1.0 / _72;
    float _80 = float(uint(_76));
    int _82 = abs(_76);
    float _84 = as_type<float>(_60) * _80;
    float _86 = float(uint(_82));
    int _88 = as_type<int>(_78) + (-2);
    float _90 = trunc(_84);
    float _92 = precise::max(_90, 0.0);
    uint _95 = uint(_92);
    float _97 = as_type<float>(_88) * _86;
    int _99 = ~_68;
    int _101 = _99 + 1;
    float _103 = trunc(_97);
    float _105 = precise::max(_103, 0.0);
    uint _107 = uint(_105);
    int _109 = -as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    int _111 = _62 * int(_95);
    int _113 = _111 + _76;
    float _115 = float(uint(_113));
    float _117 = as_type<float>(_60) * _115;
    int _119 = _101 * int(_107);
    int _121 = _119 + _82;
    float _123 = in.m_31.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = trunc(_117);
    float _131 = precise::max(_129, 0.0);
    uint _133 = uint(_131);
    float _135 = float(uint(_121));
    float _137 = as_type<float>(_88) * _135;
    float _139 = in.m_31.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = trunc(_137);
    float _147 = precise::max(_145, 0.0);
    uint _149 = uint(_147);
    int _151 = int(_95) + int(_133);
    int _153 = -_68;
    float _155 = in.m_31.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    int _161 = _109 * _151;
    int _163 = _161 + _76;
    bool _167 = uint(_163) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    int _169 = int(_107) + int(_149);
    bool _171 = !_167;
    int _173 = _171 ? 0 : (-1);
    bool _175 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    int _177 = _153 * _169;
    int _179 = _177 + _82;
    int _181 = ~_151;
    int _183 = _181 + _173;
    int _185 = _183 + 1;
    float _187 = _64 * _127;
    bool _189 = uint(_179) >= uint(_68);
    int _191 = _185 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    int _193 = _191 + _76;
    int _195 = _76 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _197 = 1.0 / _187;
    bool _199 = !_189;
    int _201 = _199 ? 0 : (-1);
    bool _203 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y) == 0;
    bool _205 = !_175;
    int _207 = _205 ? _193 : (-1);
    int _209 = -_201;
    int _211 = _169 + _209;
    uint _213 = uint(int(uint(_195) >> uint(31)));
    float _215 = float(_207);
    float _217 = _64 * _143;
    int _219 = -int(_213);
    float _221 = _64 * _159;
    float _223 = rint(_215);
    float _225 = precise::max(_223, 0.0);
    uint _227 = uint(_225);
    uint _229 = clamp(_227, 0u, 65535u);
    float _231 = _217 * _197;
    int _233 = _211 ^ _219;
    float _235 = _221 * _197;
    float _237 = _70 * _197;
    float _239 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[30].z, _231);
    int _241 = ~_219;
    int _243 = _241 + _233;
    int _245 = _243 + 1;
    float _247 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[30].w, _235);
    float _249 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[30].z, _231);
    float _251 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[30].w, _235);
    bool _253 = !_203;
    int _255 = _253 ? _245 : (-1);
    float _257 = float(_255);
    float3 _600 = float3(_239, _247, float(int(_229)));
    float3 _604 = select(_600, float3(0.0), isnan(_600));
    float _259 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _604.xy, uint(rint(_604.z)), _237, level(_257));
    float3 _614 = float3(_249, _247, float(int(_229)));
    float3 _616 = select(_614, float3(0.0), isnan(_614));
    float _261 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _616.xy, uint(rint(_616.z)), _237, level(_257));
    float3 _626 = float3(_239, _251, float(int(_229)));
    float3 _628 = select(_626, float3(0.0), isnan(_626));
    float _263 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _628.xy, uint(rint(_628.z)), _237, level(_257));
    float3 _638 = float3(_249, _251, float(int(_229)));
    float3 _640 = select(_638, float3(0.0), isnan(_638));
    float _265 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _640.xy, uint(rint(_640.z)), _237, level(_257));
    float _267 = _259 + _261;
    float _269 = _267 + _263;
    float _271 = _269 + _265;
    float _273 = _271 * 0.25;
    float _275 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[30].x, (*spvDescriptorSet0.fp_c3)._m0[30].y);
    out.m_34.x = _275;
    out.m_34.w = (*spvDescriptorSet0.fp_c3)._m0[8].x;
    return out;
}

