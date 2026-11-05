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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_31.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_33.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_29.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_31.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_29.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_33.z;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_31.z;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_35.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = rint((*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _133 = precise::max(_131, 0.0);
    uint _136 = uint(_133);
    uint _138 = clamp(_136, 0u, 65535u);
    float _140 = 1.0 / _45;
    float _142 = _140 * _51;
    float _144 = _140 * _57;
    float _146 = _140 * _63;
    float _148 = _140 * _69;
    float _150 = _140 * _75;
    float _152 = _140 * _81;
    float _154 = _140 * _87;
    float _156 = _140 * _93;
    float _158 = _140 * _99;
    float _160 = _140 * _105;
    float _162 = _140 * _111;
    float _164 = _140 * _117;
    float _166 = _140 * _123;
    float _168 = _140 * _129;
    float3 _475 = float3(_156, _148, float(int(_138)));
    float3 _480 = select(_475, float3(0.0), isnan(_475));
    float4 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _480.xy, uint(rint(_480.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _480.xy, uint(rint(_480.z))).xyzw;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float _179 = _171.w;
    float3 _497 = float3(_158, _142, float(int(_138)));
    float3 _499 = select(_497, float3(0.0), isnan(_497));
    float4 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _499.xy, uint(rint(_499.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _499.xy, uint(rint(_499.z))).xyzw;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float _189 = _181.w;
    float3 _516 = float3(_160, _144, float(int(_138)));
    float3 _518 = select(_516, float3(0.0), isnan(_516));
    float4 _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _518.xy, uint(rint(_518.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _518.xy, uint(rint(_518.z))).xyzw;
    float _193 = _191.x;
    float _195 = _191.y;
    float _197 = _191.z;
    float _199 = _191.w;
    float3 _535 = float3(_168, _154, float(int(_138)));
    float3 _537 = select(_535, float3(0.0), isnan(_535));
    float4 _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _537.xy, uint(rint(_537.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _537.xy, uint(rint(_537.z))).xyzw;
    float _203 = _201.x;
    float _205 = _201.y;
    float _207 = _201.z;
    float _209 = _201.w;
    float3 _554 = float3(_166, _152, float(int(_138)));
    float3 _556 = select(_554, float3(0.0), isnan(_554));
    float4 _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _556.xy, uint(rint(_556.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _556.xy, uint(rint(_556.z))).xyzw;
    float _213 = _211.x;
    float _215 = _211.y;
    float _217 = _211.z;
    float _219 = _211.w;
    float3 _573 = float3(_164, _150, float(int(_138)));
    float3 _575 = select(_573, float3(0.0), isnan(_573));
    float4 _221 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _575.xy, uint(rint(_575.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _575.xy, uint(rint(_575.z))).xyzw;
    float _223 = _221.x;
    float _225 = _221.y;
    float _227 = _221.z;
    float _229 = _221.w;
    float3 _592 = float3(_162, _146, float(int(_138)));
    float3 _594 = select(_592, float3(0.0), isnan(_592));
    float4 _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _594.xy, uint(rint(_594.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _594.xy, uint(rint(_594.z))).xyzw;
    float _233 = _231.x;
    float _235 = _231.y;
    float _237 = _231.z;
    float _239 = _231.w;
    float _241 = _175 * 286.0;
    float _243 = _173 * 286.0;
    float _245 = _177 * 286.0;
    float _247 = _179 * 286.0;
    float _249 = fma(_185, 13.0, _241);
    float _251 = fma(_183, 13.0, _243);
    float _253 = fma(_187, 13.0, _245);
    float _255 = fma(_189, 13.0, _247);
    float _257 = fma(_195, 1287.0, _249);
    float _259 = fma(_193, 1287.0, _251);
    float _261 = fma(_197, 1287.0, _253);
    float _263 = fma(_199, 1287.0, _255);
    float _265 = fma(_205, 924.0, _257);
    float _267 = fma(_203, 924.0, _259);
    float _269 = fma(_207, 924.0, _261);
    float _271 = fma(_209, 924.0, _263);
    float _273 = fma(_215, 1287.0, _265);
    float _275 = fma(_213, 1287.0, _267);
    float _277 = fma(_217, 1287.0, _269);
    float _279 = fma(_219, 1287.0, _271);
    float _281 = fma(_225, 286.0, _273);
    float _283 = fma(_223, 286.0, _275);
    float _285 = fma(_227, 286.0, _277);
    float _287 = fma(_229, 286.0, _279);
    float _289 = fma(_235, 13.0, _281);
    float _291 = fma(_233, 13.0, _283);
    float _293 = fma(_237, 13.0, _285);
    float _295 = fma(_239, 13.0, _287);
    float _297 = _289 * 0.000245700008235871791839599609375;
    float _299 = _291 * 0.000245700008235871791839599609375;
    float _301 = _293 * 0.000245700008235871791839599609375;
    float _303 = _295 * 0.000245700008235871791839599609375;
    out.m_38.x = _299;
    out.m_38.y = _297;
    out.m_38.z = _301;
    out.m_38.w = _303;
    return out;
}

