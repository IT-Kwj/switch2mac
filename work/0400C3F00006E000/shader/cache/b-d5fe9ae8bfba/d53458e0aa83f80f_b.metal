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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_27 [[user(locn2)]];
    float4 m_25 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_25.w;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_25.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_25.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_27.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_27.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_27.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _41;
    float _81 = _79 * _47;
    float _83 = _79 * _53;
    float _85 = _79 * _59;
    float _87 = _79 * _65;
    float _89 = _79 * _71;
    float _91 = _79 * _77;
    float2 _407 = float2(_85, _83);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_407, float2(0.0), isnan(_407)), level(_81), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_407, float2(0.0), isnan(_407)), level(_81), int2(1)).w;
    float2 _421 = float2(_85, _83);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421)), level(_81)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_421, float2(0.0), isnan(_421)), level(_81)).w;
    float2 _430 = float2(_85, _83);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_430, float2(0.0), isnan(_430)), level(_81), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_430, float2(0.0), isnan(_430)), level(_81), int2(1, 0)).w;
    float2 _440 = float2(_85, _83);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_440, float2(0.0), isnan(_440)), level(_81), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_440, float2(0.0), isnan(_440)), level(_81), int2(0, 1)).w;
    float2 _450 = float2(_91, _87);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_450, float2(0.0), isnan(_450)), level(_89)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_450, float2(0.0), isnan(_450)), level(_89)).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float _111 = in.m_29.z;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_29.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_29.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_29.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_31.x;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_31.y;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_31.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_31.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _79 * _115;
    float _161 = _79 * _133;
    float _163 = _159 * 0.15915493667125701904296875;
    float _165 = _79 * _121;
    float _167 = _161 * 0.15915493667125701904296875;
    float _169 = _165 * 0.15915493667125701904296875;
    float _171 = _79 * _127;
    float _173 = _163 * 6.283185482025146484375;
    float _175 = cos(_173);
    float _177 = _171 * 0.15915493667125701904296875;
    float _179 = _79 * _139;
    float _181 = _179 * 0.15915493667125701904296875;
    float _183 = _79 * _145;
    float _185 = _167 * 6.283185482025146484375;
    float _187 = cos(_185);
    float _189 = _183 * 0.15915493667125701904296875;
    float _191 = _79 * _151;
    float _193 = _79 * _157;
    float _195 = _169 * 6.283185482025146484375;
    float _197 = sin(_195);
    float _199 = _193 * 0.15915493667125701904296875;
    float _201 = _191 * 0.15915493667125701904296875;
    float _203 = _177 * 6.283185482025146484375;
    float _205 = sin(_203);
    float _207 = _187 * _187;
    float _209 = _207 * _175;
    float _211 = _181 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = _197 * _197;
    float _217 = _189 * 6.283185482025146484375;
    float _219 = sin(_217);
    float _221 = _215 * _205;
    float _223 = _201 * 6.283185482025146484375;
    float _225 = sin(_223);
    float _227 = _209 * _213;
    float _229 = _199 * 6.283185482025146484375;
    float _231 = cos(_229);
    float _233 = _221 * _219;
    float _235 = _225 * 0.0199999995529651641845703125;
    float _237 = fma(_227, 0.5, _235);
    float _239 = _231 * 0.0199999995529651641845703125;
    float _241 = _237 * 16.0;
    float _243 = fma(_233, 0.5, _239);
    float _245 = floor(_241);
    float _247 = _243 * 16.0;
    float _249 = floor(_247);
    float _251 = -_245;
    float _253 = _241 + _251;
    float _255 = fma(_253, 3.0518044695782009512186050415039e-06, -1.525902234789100475609302520752e-06);
    float _257 = -_249;
    float _259 = _247 + _257;
    float _261 = fma(_259, 3.0518044695782009512186050415039e-06, -1.525902234789100475609302520752e-06);
    bool _265 = _95 == _93;
    float _267 = float(_265);
    bool _269 = _97 == _93;
    float _271 = float(_269);
    bool _273 = _97 == _99;
    float _275 = float(_273);
    bool _277 = _95 == _99;
    float _279 = float(_277);
    float _281 = _267 + _271;
    bool _283 = _99 == _93;
    float _285 = float(_283);
    bool _287 = _95 == _97;
    float _289 = float(_287);
    float _291 = _279 + _275;
    float _293 = _285 + _281;
    float _295 = _289 + _279;
    float _297 = _289 + _275;
    float _299 = _285 + _291;
    float _301 = _255 + _293;
    float _303 = _267 + _295;
    float _305 = _271 + _297;
    bool _307 = _299 > _301;
    float _309 = _255 + _305;
    float _311 = _307 ? _299 : _293;
    bool _313 = _303 > _309;
    float _315 = _261 + _311;
    float _317 = _313 ? _303 : _305;
    bool _319 = _317 > _315;
    float _321 = _313 ? _95 : _97;
    float _323 = _321;
    if (!_319)
    {
        float _325 = _307 ? _99 : _93;
        _323 = _325;
    }
    float _327 = _323;
    float _329 = fma(_327, 510.0, 0.25);
    float _331 = floor(_329);
    float _333 = fma(_331, 0.00196078442968428134918212890625, 3.9215687138494104146957397460938e-05);
    out.m_34.x = _105;
    out.m_34.y = _107;
    out.m_34.z = _109;
    out.m_34.w = _333;
    return out;
}

