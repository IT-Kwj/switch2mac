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
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x));
    int _58 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y));
    bool _62 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y) == 0;
    float _64 = 1.0 / _55;
    float _66 = 1.0 / _41;
    float _68 = _66 * _47;
    float _70 = _66 * _53;
    int _72 = as_type<int>(_64) + (-2);
    int _74 = -as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    float _76 = float(uint(_58));
    float _78 = trunc(_68);
    int _80 = int(_78);
    int _82 = ~_58;
    int _84 = _82 + 1;
    float _86 = 1.0 / _76;
    float _88 = float(uint(_80));
    int _90 = abs(_80);
    float _92 = as_type<float>(_72) * _88;
    float _94 = float(uint(_90));
    int _96 = as_type<int>(_86) + (-2);
    float _98 = trunc(_92);
    float _100 = precise::max(_98, 0.0);
    uint _103 = uint(_100);
    float _105 = as_type<float>(_96) * _94;
    int _107 = ~_58;
    int _109 = _107 + 1;
    float _111 = trunc(_105);
    float _113 = precise::max(_111, 0.0);
    uint _115 = uint(_113);
    int _117 = ~as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    int _119 = _117 + 1;
    int _121 = _74 * int(_103);
    int _123 = _121 + _80;
    float _125 = float(uint(_123));
    int _127 = _109 * int(_115);
    int _129 = _127 + _90;
    float _131 = as_type<float>(_72) * _125;
    float _133 = float(uint(_129));
    float _135 = in.m_31.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = trunc(_131);
    float _143 = precise::max(_141, 0.0);
    uint _145 = uint(_143);
    float _147 = as_type<float>(_96) * _133;
    float _149 = in.m_31.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = trunc(_147);
    float _157 = precise::max(_155, 0.0);
    uint _159 = uint(_157);
    int _161 = int(_103) + int(_145);
    float _163 = in.m_31.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    int _169 = _119 * _161;
    int _171 = _169 + _80;
    int _173 = int(_115) + int(_159);
    bool _175 = uint(_171) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    int _177 = _84 * _173;
    int _179 = _177 + _90;
    bool _181 = !_175;
    int _183 = _181 ? 0 : (-1);
    float _185 = _66 * _139;
    int _187 = ~_161;
    int _189 = _187 + _183;
    int _191 = _189 + 1;
    bool _193 = uint(_179) >= uint(_58);
    float _195 = 1.0 / _185;
    int _197 = _80 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].y);
    int _199 = _191 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    int _201 = _199 + _80;
    bool _203 = !_193;
    int _205 = _203 ? 0 : (-1);
    float _207 = _66 * _153;
    bool _209 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[31].x);
    uint _211 = uint(int(uint(_197) >> uint(31)));
    bool _213 = !_209;
    int _215 = _213 ? _201 : (-1);
    int _217 = ~_205;
    int _219 = _173 + _217;
    int _221 = _219 + 1;
    int _223 = -int(_211);
    float _225 = float(_215);
    float _227 = _66 * _167;
    float _229 = _207 * _195;
    float _231 = rint(_225);
    float _233 = precise::max(_231, 0.0);
    uint _235 = uint(_233);
    uint _237 = clamp(_235, 0u, 65535u);
    int _239 = _221 ^ _223;
    float _241 = _70 * _195;
    float _243 = _227 * _195;
    int _245 = ~_223;
    int _247 = _245 + _239;
    int _249 = _247 + 1;
    float _251 = fma(-1.5, (*spvDescriptorSet0.fp_c3)._m0[30].z, _229);
    float _253 = fma(-1.5, (*spvDescriptorSet0.fp_c3)._m0[30].w, _241);
    bool _255 = !_62;
    int _257 = _255 ? _249 : (-1);
    float _259 = fma((*spvDescriptorSet0.fp_c3)._m0[30].w, -0.5, _241);
    float _261 = fma((*spvDescriptorSet0.fp_c3)._m0[30].z, -0.5, _229);
    float _263 = fma((*spvDescriptorSet0.fp_c3)._m0[30].z, 0.5, _229);
    float _265 = float(_257);
    float _267 = fma((*spvDescriptorSet0.fp_c3)._m0[30].z, 1.5, _229);
    float3 _678 = float3(_261, _253, float(int(_237)));
    float3 _682 = select(_678, float3(0.0), isnan(_678));
    float _269 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _682.xy, uint(rint(_682.z)), _243, level(_265));
    float3 _692 = float3(_251, _253, float(int(_237)));
    float3 _694 = select(_692, float3(0.0), isnan(_692));
    float _271 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _694.xy, uint(rint(_694.z)), _243, level(_265));
    float3 _704 = float3(_263, _253, float(int(_237)));
    float3 _706 = select(_704, float3(0.0), isnan(_704));
    float _273 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _706.xy, uint(rint(_706.z)), _243, level(_265));
    float3 _716 = float3(_267, _253, float(int(_237)));
    float3 _718 = select(_716, float3(0.0), isnan(_716));
    float _275 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _718.xy, uint(rint(_718.z)), _243, level(_265));
    float3 _728 = float3(_251, _259, float(int(_237)));
    float3 _730 = select(_728, float3(0.0), isnan(_728));
    float _277 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _730.xy, uint(rint(_730.z)), _243, level(_265));
    float3 _740 = float3(_261, _259, float(int(_237)));
    float3 _742 = select(_740, float3(0.0), isnan(_740));
    float _279 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _742.xy, uint(rint(_742.z)), _243, level(_265));
    float _281 = fma((*spvDescriptorSet0.fp_c3)._m0[30].w, 0.5, _241);
    float3 _756 = float3(_263, _259, float(int(_237)));
    float3 _758 = select(_756, float3(0.0), isnan(_756));
    float _283 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _758.xy, uint(rint(_758.z)), _243, level(_265));
    float3 _768 = float3(_267, _259, float(int(_237)));
    float3 _770 = select(_768, float3(0.0), isnan(_768));
    float _285 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _770.xy, uint(rint(_770.z)), _243, level(_265));
    float3 _780 = float3(_251, _281, float(int(_237)));
    float3 _782 = select(_780, float3(0.0), isnan(_780));
    float _287 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _782.xy, uint(rint(_782.z)), _243, level(_265));
    float3 _792 = float3(_261, _281, float(int(_237)));
    float3 _794 = select(_792, float3(0.0), isnan(_792));
    float _289 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _794.xy, uint(rint(_794.z)), _243, level(_265));
    float3 _804 = float3(_263, _281, float(int(_237)));
    float3 _806 = select(_804, float3(0.0), isnan(_804));
    float _291 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _806.xy, uint(rint(_806.z)), _243, level(_265));
    float _293 = fma((*spvDescriptorSet0.fp_c3)._m0[30].w, 1.5, _241);
    float3 _820 = float3(_267, _281, float(int(_237)));
    float3 _822 = select(_820, float3(0.0), isnan(_820));
    float _295 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _822.xy, uint(rint(_822.z)), _243, level(_265));
    float3 _832 = float3(_251, _293, float(int(_237)));
    float3 _834 = select(_832, float3(0.0), isnan(_832));
    float _297 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _834.xy, uint(rint(_834.z)), _243, level(_265));
    float3 _844 = float3(_261, _293, float(int(_237)));
    float3 _846 = select(_844, float3(0.0), isnan(_844));
    float _299 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _846.xy, uint(rint(_846.z)), _243, level(_265));
    float3 _856 = float3(_263, _293, float(int(_237)));
    float3 _858 = select(_856, float3(0.0), isnan(_856));
    float _301 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _858.xy, uint(rint(_858.z)), _243, level(_265));
    float3 _868 = float3(_267, _293, float(int(_237)));
    float3 _870 = select(_868, float3(0.0), isnan(_868));
    float _303 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _870.xy, uint(rint(_870.z)), _243, level(_265));
    float _305 = _271 + _269;
    float _307 = _305 + _273;
    float _309 = _307 + _275;
    float _311 = _309 + _277;
    float _313 = _311 + _279;
    float _315 = _313 + _283;
    float _317 = _315 + _285;
    float _319 = _317 + _287;
    float _321 = _319 + _289;
    float _323 = _321 + _291;
    float _325 = _323 + _295;
    float _327 = _325 + _297;
    float _329 = _327 + _299;
    float _331 = _329 + _301;
    float _333 = _331 + _303;
    float _335 = _333 * 0.0625;
    float _337 = fma(_335, (*spvDescriptorSet0.fp_c3)._m0[30].x, (*spvDescriptorSet0.fp_c3)._m0[30].y);
    out.m_34.x = _337;
    out.m_34.w = (*spvDescriptorSet0.fp_c3)._m0[8].x;
    return out;
}

