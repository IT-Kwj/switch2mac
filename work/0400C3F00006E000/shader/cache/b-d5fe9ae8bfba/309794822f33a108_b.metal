#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _312 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_312, float2(0.0), isnan(_312))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_312, float2(0.0), isnan(_312))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _78 = _68 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _82 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _86 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _90 = _68 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _92 = _88 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _94 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _84);
    float _98 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _76);
    float _100 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _94);
    float _102 = 1.0 / _92;
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _106 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _98);
    float _108 = _100 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _110 = _104 * _102;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = _106 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _116 = _108 * _102;
    float _118 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _120 = _114 * _102;
    float _122 = rint(_112);
    float _124 = precise::max(_122, 0.0);
    uint _127 = uint(_124);
    uint _129 = clamp(_127, 0u, 65535u);
    float _131 = fma(_86, 0.5, _116);
    float _133 = fma(_86, 1.5, _116);
    float _135 = fma(_86, -0.5, _116);
    float _137 = fma(_86, -1.5, _116);
    float _139 = _68 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _141 = fma(_118, 1.5, _120);
    float _143 = fma(_118, 0.5, _120);
    float _145 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _139);
    float3 _506 = float3(_133, _141, float(int(_129)));
    float3 _510 = select(_506, float3(0.0), isnan(_506));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _510.xy, uint(rint(_510.z)), 1.0);
    float3 _518 = float3(_131, _141, float(int(_129)));
    float3 _520 = select(_518, float3(0.0), isnan(_518));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _520.xy, uint(rint(_520.z)), 1.0);
    float3 _528 = float3(_135, _141, float(int(_129)));
    float3 _530 = select(_528, float3(0.0), isnan(_528));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _530.xy, uint(rint(_530.z)), 1.0);
    float3 _538 = float3(_137, _141, float(int(_129)));
    float3 _540 = select(_538, float3(0.0), isnan(_538));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _540.xy, uint(rint(_540.z)), 1.0);
    float3 _548 = float3(_131, _143, float(int(_129)));
    float3 _550 = select(_548, float3(0.0), isnan(_548));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _550.xy, uint(rint(_550.z)), 1.0);
    float3 _558 = float3(_135, _143, float(int(_129)));
    float3 _560 = select(_558, float3(0.0), isnan(_558));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _560.xy, uint(rint(_560.z)), 1.0);
    float _159 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _145);
    float _161 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _78);
    float _163 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _90);
    float _165 = fma(_118, -0.5, _120);
    float _167 = _159 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _169 = fma(_118, -1.5, _120);
    float _171 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _161);
    float _173 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _163);
    float _175 = 1.0 / _167;
    float3 _605 = float3(_133, _143, float(int(_129)));
    float3 _607 = select(_605, float3(0.0), isnan(_605));
    float _177 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _607.xy, uint(rint(_607.z)), 1.0);
    float3 _615 = float3(_137, _143, float(int(_129)));
    float3 _617 = select(_615, float3(0.0), isnan(_615));
    float _179 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _617.xy, uint(rint(_617.z)), 1.0);
    float _181 = _171 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _183 = _173 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _633 = float3(_131, _165, float(int(_129)));
    float3 _635 = select(_633, float3(0.0), isnan(_633));
    float _185 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _635.xy, uint(rint(_635.z)), 1.0);
    float3 _643 = float3(_133, _165, float(int(_129)));
    float3 _645 = select(_643, float3(0.0), isnan(_643));
    float _187 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _645.xy, uint(rint(_645.z)), 1.0);
    float3 _653 = float3(_135, _165, float(int(_129)));
    float3 _655 = select(_653, float3(0.0), isnan(_653));
    float _189 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _655.xy, uint(rint(_655.z)), 1.0);
    float3 _663 = float3(_137, _165, float(int(_129)));
    float3 _665 = select(_663, float3(0.0), isnan(_663));
    float _191 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _665.xy, uint(rint(_665.z)), 1.0);
    float _193 = _181 * _175;
    float _195 = _183 * _175;
    float2 _676 = float2(_193, _195);
    float2 _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_676, float2(0.0), isnan(_676))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_676, float2(0.0), isnan(_676))).xy;
    float _201 = _199.x;
    float _203 = _199.y;
    float3 _691 = float3(_133, _169, float(int(_129)));
    float3 _693 = select(_691, float3(0.0), isnan(_691));
    float _205 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _693.xy, uint(rint(_693.z)), 1.0);
    float3 _701 = float3(_131, _169, float(int(_129)));
    float3 _703 = select(_701, float3(0.0), isnan(_701));
    float _207 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _703.xy, uint(rint(_703.z)), 1.0);
    float3 _711 = float3(_135, _169, float(int(_129)));
    float3 _713 = select(_711, float3(0.0), isnan(_711));
    float _209 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _713.xy, uint(rint(_713.z)), 1.0);
    float3 _721 = float3(_137, _169, float(int(_129)));
    float3 _723 = select(_721, float3(0.0), isnan(_721));
    float _211 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _723.xy, uint(rint(_723.z)), 1.0);
    float2 _728 = float2(_48, _50);
    float _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_728, float2(0.0), isnan(_728))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_728, float2(0.0), isnan(_728))).x;
    float _215 = _68 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _217 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _215);
    float _219 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _217);
    float _221 = _219 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _223 = precise::min(_221, 1.0);
    float _225 = -_66;
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _229 = _225 + _227;
    float _231 = _229 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _147 + _149;
    float _237 = _235 + _151;
    float _239 = _237 + _153;
    float _241 = _239 + _177;
    float _243 = _241 + _155;
    float _245 = _243 + _157;
    float _247 = _245 + _179;
    float _249 = _247 + _187;
    float _251 = -_201;
    float _253 = fma(_251, _201, _203);
    float _255 = -_201;
    float _257 = _223 + _255;
    float _259 = _249 + _185;
    float _261 = fma(_257, _257, _253);
    float _263 = _259 + _189;
    bool _267 = _257 <= 0.001000000047497451305389404296875;
    float _269 = float(_267);
    float _271 = 1.0 / _261;
    float _273 = _263 + _191;
    float _275 = _273 + _205;
    float _277 = _275 + _207;
    float _279 = _277 + _209;
    float _281 = -_66;
    float _283 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _285 = _281 + _283;
    float _287 = _253 * _271;
    float _289 = _279 + _211;
    float _291 = _285 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = precise::max(_287, _269);
    float _297 = fma(_289, 0.0625, _233);
    float _299 = precise::min(_295, 1.0);
    float _301 = _293 + _299;
    out.m_41.x = _213;
    out.m_41.y = _297;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _301;
    return out;
}

