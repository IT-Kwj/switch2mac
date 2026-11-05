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
    float _43 = in.m_25.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_25.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_27.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_27.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float2 _371 = float2(_69, _71);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_371, float2(0.0), isnan(_371)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_371, float2(0.0), isnan(_371)), int2(1)).w;
    float2 _384 = float2(_69, _71);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_384, float2(0.0), isnan(_384))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_384, float2(0.0), isnan(_384))).w;
    float2 _392 = float2(_69, _71);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_392, float2(0.0), isnan(_392)), int2(1, 0)).w;
    float2 _401 = float2(_69, _71);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_401, float2(0.0), isnan(_401)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_401, float2(0.0), isnan(_401)), int2(0, 1)).w;
    float2 _410 = float2(_73, _75);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_410, float2(0.0), isnan(_410))).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = in.m_29.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_29.z;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_29.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_29.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_31.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_31.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_31.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_31.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _67 * _99;
    float _145 = _67 * _105;
    float _147 = _143 * 0.15915493667125701904296875;
    float _149 = _145 * 0.15915493667125701904296875;
    float _151 = _67 * _111;
    float _153 = _151 * 0.15915493667125701904296875;
    float _155 = _67 * _117;
    float _157 = _147 * 6.283185482025146484375;
    float _159 = cos(_157);
    float _161 = _155 * 0.15915493667125701904296875;
    float _163 = _67 * _123;
    float _165 = _163 * 0.15915493667125701904296875;
    float _167 = _67 * _129;
    float _169 = _153 * 6.283185482025146484375;
    float _171 = sin(_169);
    float _173 = _167 * 0.15915493667125701904296875;
    float _175 = _67 * _135;
    float _177 = _67 * _141;
    float _179 = _159 * _159;
    float _181 = _149 * 6.283185482025146484375;
    float _183 = cos(_181);
    float _185 = _177 * 0.15915493667125701904296875;
    float _187 = _175 * 0.15915493667125701904296875;
    float _189 = _161 * 6.283185482025146484375;
    float _191 = sin(_189);
    float _193 = _171 * _171;
    float _195 = _165 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = _179 * _183;
    float _201 = _173 * 6.283185482025146484375;
    float _203 = sin(_201);
    float _205 = _193 * _191;
    float _207 = _187 * 6.283185482025146484375;
    float _209 = sin(_207);
    float _211 = _199 * _197;
    float _213 = _185 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = _205 * _203;
    float _219 = _209 * 0.0199999995529651641845703125;
    float _221 = fma(_211, 0.5, _219);
    float _223 = _215 * 0.0199999995529651641845703125;
    float _225 = _221 * 16.0;
    float _227 = fma(_217, 0.5, _223);
    float _229 = floor(_225);
    float _231 = _227 * 16.0;
    float _233 = floor(_231);
    float _235 = -_229;
    float _237 = _225 + _235;
    float _239 = fma(_237, 3.0518044695782009512186050415039e-06, -1.525902234789100475609302520752e-06);
    float _241 = -_233;
    float _243 = _231 + _241;
    float _245 = fma(_243, 3.0518044695782009512186050415039e-06, -1.525902234789100475609302520752e-06);
    bool _249 = _79 == _77;
    float _251 = float(_249);
    bool _253 = _81 == _77;
    float _255 = float(_253);
    bool _257 = _81 == _83;
    float _259 = float(_257);
    bool _261 = _79 == _83;
    float _263 = float(_261);
    float _265 = _251 + _255;
    bool _267 = _83 == _77;
    float _269 = float(_267);
    bool _271 = _79 == _81;
    float _273 = float(_271);
    float _275 = _263 + _259;
    float _277 = _269 + _265;
    float _279 = _273 + _263;
    float _281 = _273 + _259;
    float _283 = _269 + _275;
    float _285 = _239 + _277;
    float _287 = _251 + _279;
    float _289 = _255 + _281;
    bool _291 = _283 > _285;
    float _293 = _239 + _289;
    float _295 = _291 ? _283 : _277;
    bool _297 = _287 > _293;
    float _299 = _245 + _295;
    float _301 = _297 ? _287 : _289;
    bool _303 = _301 > _299;
    float _305 = _297 ? _79 : _81;
    float _307 = _305;
    if (!_303)
    {
        float _309 = _291 ? _83 : _77;
        _307 = _309;
    }
    float _311 = _307;
    float _313 = fma(_311, 510.0, 0.25);
    float _315 = floor(_313);
    float _317 = fma(_315, 0.00196078442968428134918212890625, 3.9215687138494104146957397460938e-05);
    out.m_34.x = _89;
    out.m_34.y = _91;
    out.m_34.z = _93;
    out.m_34.w = _317;
    return out;
}

