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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c5 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
    float4 m_40 [[color(2)]];
    float4 m_42 [[color(3)]];
    float4 m_44 [[color(4)]];
    float4 m_46 [[color(5)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _395 = float2(_69, _71);
    float3 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_395, float2(0.0), isnan(_395))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_395, float2(0.0), isnan(_395))).xyz;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _79 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _85 = _79 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _87 = _81 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _89 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].x, _83);
    float _91 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[2].x, _85);
    float _93 = -_77;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c4)._m0[1].x, _83);
    float _97 = -_77;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].x, _85);
    float _101 = -_81;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[1].z, _89);
    float _105 = -_81;
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[2].z, _91);
    float _109 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[1].z, _95);
    float _111 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].z, _99);
    float _113 = _81 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _115 = -_87;
    float _117 = _83 + _115;
    float _119 = _83 + _87;
    float _121 = -_87;
    float _123 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].y, _121);
    float _125 = -_113;
    float _127 = _85 + _125;
    float _129 = _85 + _113;
    float _131 = -_113;
    float _133 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[2].y, _131);
    float _135 = -_77;
    float _137 = -_87;
    float _139 = fma(_135, (*spvDescriptorSet0.fp_c4)._m0[1].y, _137);
    float _141 = -_77;
    float _143 = -_113;
    float _145 = fma(_141, (*spvDescriptorSet0.fp_c4)._m0[2].y, _143);
    float _147 = -_77;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[1].z, _117);
    float _151 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[1].z, _123);
    float _153 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].z, _119);
    float _155 = -_79;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c4)._m0[1].z, _139);
    float _159 = -_79;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c4)._m0[2].z, _145);
    float _163 = -_77;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c4)._m0[2].z, _127);
    float _167 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[2].z, _129);
    float _169 = fma(_103, -0.5, 0.5);
    float _171 = fma(_149, -0.5, 0.5);
    float _173 = fma(_107, -0.5, 0.5);
    float2 _581 = float2(_169, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_581, float2(0.0), isnan(_581))).x;
    float _177 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[2].z, _133);
    float _179 = fma(_109, -0.5, 0.5);
    float2 _598 = float2(_173, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_598, float2(0.0), isnan(_598))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_598, float2(0.0), isnan(_598))).x;
    float _183 = fma(_111, -0.5, 0.5);
    float _185 = fma(_161, -0.5, 0.5);
    float _187 = fma(_151, -0.5, 0.5);
    float _189 = fma(_157, -0.5, 0.5);
    float _191 = fma(_153, -0.5, 0.5);
    float _193 = fma(_177, -0.5, 0.5);
    float _195 = fma(_165, -0.5, 0.5);
    float _197 = fma(_167, -0.5, 0.5);
    float2 _623 = float2(_179, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_623, float2(0.0), isnan(_623))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_623, float2(0.0), isnan(_623))).x;
    float2 _632 = float2(_183, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_632, float2(0.0), isnan(_632))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_632, float2(0.0), isnan(_632))).x;
    float2 _641 = float2(_187, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_641, float2(0.0), isnan(_641))).x;
    float2 _650 = float2(_193, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_650, float2(0.0), isnan(_650))).x;
    float2 _659 = float2(_189, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_659, float2(0.0), isnan(_659))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_659, float2(0.0), isnan(_659))).x;
    float2 _668 = float2(_185, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_668, float2(0.0), isnan(_668))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_668, float2(0.0), isnan(_668))).x;
    float2 _677 = float2(_171, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_677, float2(0.0), isnan(_677))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_677, float2(0.0), isnan(_677))).x;
    float2 _686 = float2(_191, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_686, float2(0.0), isnan(_686))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_686, float2(0.0), isnan(_686))).x;
    float2 _695 = float2(_195, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_695, float2(0.0), isnan(_695))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_695, float2(0.0), isnan(_695))).x;
    float2 _704 = float2(_197, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_704, float2(0.0), isnan(_704))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_704, float2(0.0), isnan(_704))).x;
    float _219 = _183 + _179;
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _225 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _227 = _225 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _233 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _235 = _233 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _237 = _173 + _169;
    float _239 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _241 = _239 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _243 = _193 + _187;
    float _245 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _247 = _245 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _249 = _185 + _189;
    float _251 = _195 + _171;
    float _253 = _197 + _191;
    float _255 = fma(_175, _223, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _257 = fma(_175, _231, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _259 = fma(_175, _241, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _261 = fma(_181, _227, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _263 = fma(_181, _235, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _265 = fma(_181, _247, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _267 = _261 + _255;
    float _269 = _263 + _257;
    float _271 = _265 + _259;
    float _273 = fma(_223, _199, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _275 = fma(_227, _201, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _277 = fma(_231, _199, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _279 = fma(_241, _199, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _281 = fma(_235, _201, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _283 = fma(_247, _201, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _285 = _275 + _273;
    float _287 = fma(_223, _203, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _289 = _281 + _277;
    float _291 = _283 + _279;
    float _293 = fma(_231, _203, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _295 = fma(_241, _203, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _297 = fma(_227, _205, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _299 = fma(_235, _205, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _301 = fma(_247, _205, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _303 = fma(_231, _211, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _305 = _297 + _287;
    float _307 = _299 + _293;
    float _309 = _301 + _295;
    float _311 = fma(_223, _207, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _313 = fma(_231, _207, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _315 = fma(_241, _207, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _317 = fma(_227, _209, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _319 = fma(_247, _209, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _321 = fma(_235, _209, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _323 = fma(_231, _213, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _325 = _317 + _311;
    float _327 = _319 + _315;
    float _329 = fma(_223, _211, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _331 = fma(_223, _213, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _333 = _321 + _313;
    float _335 = fma(_235, _215, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _337 = fma(_227, _215, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _339 = fma(_241, _211, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _341 = fma(_241, _213, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _343 = _335 + _303;
    float _345 = _337 + _329;
    float _347 = fma(_247, _215, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _349 = fma(_227, _217, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _351 = fma(_235, _217, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _353 = fma(_247, _217, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _355 = _347 + _339;
    float _357 = _349 + _331;
    float _359 = _351 + _323;
    float _361 = _353 + _341;
    out.m_36.x = _267;
    out.m_36.y = _269;
    out.m_36.z = _271;
    out.m_36.w = _237;
    out.m_38.x = _285;
    out.m_38.y = _289;
    out.m_38.z = _291;
    out.m_38.w = _219;
    out.m_40.x = _305;
    out.m_40.y = _307;
    out.m_40.z = _309;
    out.m_40.w = _243;
    out.m_42.x = _325;
    out.m_42.y = _333;
    out.m_42.z = _327;
    out.m_42.w = _249;
    out.m_44.x = _345;
    out.m_44.y = _343;
    out.m_44.z = _355;
    out.m_44.w = _251;
    out.m_46.x = _357;
    out.m_46.y = _359;
    out.m_46.z = _361;
    out.m_46.w = _253;
    return out;
}

