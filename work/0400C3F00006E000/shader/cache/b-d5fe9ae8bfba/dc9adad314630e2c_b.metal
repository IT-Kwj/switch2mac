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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0), center_no_perspective]];
    float4 m_35 [[user(locn1), center_no_perspective]];
    float4 m_33 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _47 = in.m_33.x;
    float _49 = in.m_33.y;
    float2 _341 = float2(_47, _49);
    float4 _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_341, float2(0.0), isnan(_341))).xyzw;
    float _54 = _52.x;
    float _56 = _52.y;
    float _58 = _52.z;
    float _60 = _52.w;
    float2 _360 = float2(_47, _49);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_360, float2(0.0), isnan(_360))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_360, float2(0.0), isnan(_360))).x;
    float2 _367 = float2(_60, 0.0);
    float2 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_367, float2(0.0), isnan(_367))).xy;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = in.m_35.y;
    float _74 = in.m_35.x;
    float _76 = in.m_35.z;
    float _78 = in.m_37.w;
    float _80 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _82 = fma(_54, 2.0, -1.0);
    float _84 = fma(_58, 2.0, -1.0);
    float _86 = -_80;
    float _88 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _90 = fma(_86, _72, _88);
    float _92 = _72 * _72;
    float _94 = -_80;
    float _96 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _98 = fma(_94, _74, _96);
    float _100 = -_80;
    float _102 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _104 = fma(_100, _76, _102);
    float _106 = _90 * _90;
    float _108 = fma(_74, _74, _92);
    float _110 = fma(_98, _98, _106);
    float _112 = _108 + 1.0;
    float _114 = fma(_104, _104, _110);
    float _116 = rsqrt(_112);
    float _118 = rsqrt(_114);
    float _120 = _72 * _116;
    float _122 = _74 * _116;
    float _124 = _76 * _116;
    float _126 = -_80;
    float _128 = fma(_126, _78, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _130 = in.m_37.y;
    float _132 = -_128;
    float _134 = fma(_132, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _136 = _90 * _118;
    float _138 = _98 * _118;
    float _140 = _104 * _118;
    float _142 = in.m_37.x;
    float _144 = -_120;
    float _146 = _136 + _144;
    float _148 = -_122;
    float _150 = _138 + _148;
    float _152 = -_124;
    float _154 = _140 + _152;
    bool _158 = _134 <= 1.0;
    bool _160 = isnan(_134);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = float(_166);
    float _170 = _146 * _146;
    float _172 = _82 * _138;
    float _174 = fma(_150, _150, _170);
    float _176 = _134 * _168;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = fma(_154, _154, _174);
    float _182 = fma(_56, 2.0, -1.0);
    float _184 = abs(_178);
    float _186 = log2(_184);
    float _188 = _182 * _146;
    float _190 = -_146;
    float _192 = _120 * _190;
    float _194 = _182 * _90;
    float _196 = -_82;
    float _198 = -_188;
    float _200 = fma(_196, _150, _198);
    float _202 = -_122;
    float _204 = fma(_202, _150, _192);
    float _206 = rsqrt(_180);
    float _208 = fma(_82, _98, _194);
    float _210 = -_84;
    float _212 = fma(_210, _154, _200);
    float _214 = -_124;
    float _216 = fma(_214, _154, _204);
    float _218 = fma(_84, _104, _208);
    float _220 = _186 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _222 = -_80;
    float _224 = fma(_222, _142, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _226 = -_80;
    float _228 = fma(_226, _130, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _230 = -_120;
    float _232 = _182 * _230;
    float _234 = exp2(_220);
    float _236 = -_118;
    float _238 = fma(_236, _218, 0.0);
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = precise::max(_224, _228);
    float _244 = _206 * _212;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = precise::min(_224, _228);
    float _250 = -_232;
    float _252 = fma(_82, _122, _250);
    float _254 = abs(_246);
    float _256 = log2(_254);
    bool _258 = _248 >= 0.0;
    bool _260 = isnan(_248);
    bool _262 = _258 || _260;
    bool _264 = isnan(0.0);
    bool _266 = _262 || _264;
    float _268 = fma(_84, _124, _252);
    bool _270 = _128 >= _242;
    bool _272 = isnan(_128);
    bool _274 = _270 || _272;
    bool _276 = isnan(_242);
    bool _278 = _274 || _276;
    bool _280 = _278 && _266;
    float _282 = float(_280);
    float _284 = 1.0 / _216;
    float _286 = _282 * _234;
    float _288 = _286 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _290 = _68 * _256;
    float _292 = -_136;
    float _294 = -_172;
    float _296 = fma(_182, _292, _294);
    float _298 = -_140;
    float _300 = fma(_84, _298, _296);
    float _302 = exp2(_290);
    float _304 = precise::min(_268, _300);
    float _306 = _246 * _304;
    float _308 = _306 * 2.0;
    float _310 = _308 * _284;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = _288 * _302;
    float _316 = _312 * _314;
    float _318 = _70 * _316;
    float _320 = _288 * _240;
    float _322 = _318 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _324 = _320 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _326 = _320 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _328 = _320 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _330 = _322 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    out.m_40.x = _324;
    out.m_40.y = _326;
    out.m_40.z = _328;
    out.m_40.w = _330;
    return out;
}

