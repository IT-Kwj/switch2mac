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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture3d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture3d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    sampler fp_t_tcb_12Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _319 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_319, float2(0.0), isnan(_319))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_319, float2(0.0), isnan(_319))).x;
    float2 _330 = float2(_52, _54);
    float3 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_330, float2(0.0), isnan(_330))).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = in.m_42.y;
    float _70 = in.m_42.x;
    float _72 = -_56;
    float _74 = -(*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _76 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].x, _74);
    float _78 = _76 * _68;
    float _80 = _76 * _70;
    float _82 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _84 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _86 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[1].x, _82);
    float _88 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _90 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[0].x, _84);
    float _92 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].z, _86);
    float _94 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[2].x, _88);
    float _96 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].z, _90);
    float _98 = _92 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _100 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].z, _94);
    float _102 = _96 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _106 = _98 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _108 = _100 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _110 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[3].x, _104);
    float _112 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[5].x, _106);
    float _114 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[3].z, _110);
    float _116 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[5].z, _112);
    float _118 = _114 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _120 = _116 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float3 _460 = float3(_118, _120, 0.0);
    float4 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_460, float3(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_460, float3(0.0), isnan(_460))).xyzw;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _123.w;
    float3 _478 = float3(_118, _120, 0.0);
    float4 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_478, float3(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_478, float3(0.0), isnan(_478))).xyzw;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float _141 = _133.w;
    float3 _494 = float3(_118, _120, 0.0);
    float4 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_494, float3(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_494, float3(0.0), isnan(_494))).xyzw;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = _143.w;
    float3 _510 = float3(_118, _120, 0.0);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_510, float3(0.0), isnan(_510))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_510, float3(0.0), isnan(_510))).x;
    float _155 = fma(_64, 2.0, -1.0);
    float _157 = fma(_62, 2.0, -1.0);
    float _159 = fma(_66, 2.0, -1.0);
    float _161 = _155 * _155;
    float _163 = _155 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _165 = fma(_157, _157, _161);
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[1].x, _163);
    float _171 = _155 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _173 = _155 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _175 = -_167;
    float _177 = _175 + 1.0;
    float _179 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[0].x, _171);
    float _181 = sqrt(_177);
    float _183 = _181 * _159;
    float _185 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[1].z, _169);
    float _187 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[2].x, _173);
    float _189 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[0].z, _179);
    float _191 = fma(_185, -0.5, 0.5);
    float _193 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[2].z, _187);
    float _195 = fma(_185, 0.5, 0.5);
    float _197 = _191 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _199 = _191 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _201 = _191 * (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _203 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[10].x, _197);
    float _205 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[10].y, _199);
    float _207 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[10].z, _201);
    float _209 = _185 * _127;
    float _211 = _185 * _137;
    float _213 = _185 * _147;
    float _215 = -_153;
    float _217 = _98 + _215;
    float _219 = fma(_189, _131, _209);
    float _221 = fma(_189, _141, _211);
    float _223 = fma(_189, _151, _213);
    float _225 = _217 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _227 = fma(_193, _129, _219);
    float _229 = fma(_193, _139, _221);
    float _231 = fma(_193, _149, _223);
    float _233 = _227 * 0.3257299959659576416015625;
    float _235 = precise::max(_225, -1.0);
    float _237 = _231 * 0.3257299959659576416015625;
    float _239 = fma(_125, 0.2820999920368194580078125, _233);
    float _241 = _229 * 0.3257299959659576416015625;
    float _243 = precise::min(_235, 1.0);
    float _245 = (*spvDescriptorSet0.fp_c3)._m0[12].y + (-1.0);
    float _247 = fma(_145, 0.2820999920368194580078125, _237);
    float _249 = fma(_135, 0.2820999920368194580078125, _241);
    bool _253 = _243 >= 0.0;
    bool _255 = isnan(_243);
    bool _257 = _253 || _255;
    bool _259 = isnan(0.0);
    bool _261 = _257 || _259;
    float _263 = abs(_243);
    float _265 = fma(_263, _245, 1.0);
    float _267 = precise::max(0.0, _239);
    float _269 = abs(_243);
    float _271 = -_269;
    float _273 = _271 + 1.0;
    float _275 = precise::max(0.0, _249);
    float _277 = precise::max(0.0, _247);
    float _279 = -_203;
    float _281 = _267 + _279;
    bool _283 = !_261;
    float _285 = _283 ? _265 : 1.0;
    float _287 = -_205;
    float _289 = _275 + _287;
    float _291 = -_207;
    float _293 = _277 + _291;
    float _295 = fma(_273, _281, _203);
    float _297 = _285 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _299 = fma(_273, _289, _205);
    float _301 = fma(_273, _293, _207);
    float _303 = _297 * _295;
    float _305 = _297 * _299;
    float _307 = _297 * _301;
    out.m_45.x = _303;
    out.m_45.y = _305;
    out.m_45.z = _307;
    return out;
}

