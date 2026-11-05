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
    float4 m_38 [[color(0)]];
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0), center_no_perspective]];
    float4 m_33 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _47 = in.m_33.x;
    float _49 = in.m_33.y;
    float2 _325 = float2(_47, _49);
    float4 _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_325, float2(0.0), isnan(_325))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_325, float2(0.0), isnan(_325))).xyzw;
    float _54 = _52.x;
    float _56 = _52.y;
    float _58 = _52.z;
    float _60 = _52.w;
    float2 _345 = float2(_47, _49);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_345, float2(0.0), isnan(_345))).x;
    float2 _352 = float2(_60, 0.0);
    float2 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_352, float2(0.0), isnan(_352))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_352, float2(0.0), isnan(_352))).xy;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = in.m_35.y;
    float _74 = in.m_35.x;
    float _76 = in.m_35.z;
    float _78 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _80 = fma(_58, 2.0, -1.0);
    float _82 = -_78;
    float _84 = -(*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _86 = fma(_82, _72, _84);
    float _88 = _72 * _72;
    float _90 = -_78;
    float _92 = -(*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _94 = fma(_90, _74, _92);
    float _96 = -_78;
    float _98 = -(*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _100 = fma(_96, _76, _98);
    float _102 = _86 * _86;
    float _104 = fma(_74, _74, _88);
    float _106 = -(*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _108 = _72 + _106;
    float _110 = -(*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _112 = _74 + _110;
    float _114 = fma(_94, _94, _102);
    float _116 = _104 + 1.0;
    float _118 = _108 * _108;
    float _120 = _86 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _122 = fma(_100, _100, _114);
    float _124 = rsqrt(_116);
    float _126 = fma(_112, _112, _118);
    float _128 = fma(_94, (*spvDescriptorSet0.fp_c4)._m0[11].x, _120);
    float _130 = fma(_100, (*spvDescriptorSet0.fp_c4)._m0[11].z, _128);
    float _132 = rsqrt(_122);
    float _134 = _72 * _124;
    float _136 = _74 * _124;
    float _138 = _76 * _124;
    float _140 = sqrt(_122);
    float _142 = _86 * _132;
    float _144 = _94 * _132;
    float _146 = _100 * _132;
    float _148 = _132 * _130;
    float _150 = -_134;
    float _152 = _150 + _142;
    float _154 = -_136;
    float _156 = _154 + _144;
    float _158 = -_138;
    float _160 = _158 + _146;
    float _162 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _164 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[13].y, _162);
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = _152 * _152;
    float _170 = fma(_56, 2.0, -1.0);
    float _172 = fma(_54, 2.0, -1.0);
    float _174 = -_140;
    float _176 = fma(_174, (*spvDescriptorSet0.fp_c4)._m0[8].w, 1.0);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = fma(_156, _156, _168);
    float _182 = _170 * _152;
    float _184 = abs(_166);
    float _186 = log2(_184);
    float _188 = _170 * _86;
    float _190 = fma(_160, _160, _180);
    float _192 = -_172;
    float _194 = -_182;
    float _196 = fma(_192, _156, _194);
    float _198 = fma(_172, _94, _188);
    float _200 = -_80;
    float _202 = fma(_200, _160, _196);
    float _204 = rsqrt(_190);
    float _206 = fma(_80, _100, _198);
    float _208 = abs(_178);
    float _210 = log2(_208);
    float _212 = _204 * _202;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = -_152;
    float _218 = _134 * _216;
    float _220 = _186 * (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _222 = -_134;
    float _224 = _170 * _222;
    float _226 = abs(_214);
    float _228 = log2(_226);
    float _230 = -_136;
    float _232 = fma(_230, _156, _218);
    float _234 = _170 * _142;
    float _236 = -_224;
    float _238 = fma(_172, _136, _236);
    float _240 = _210 * (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _242 = -_138;
    float _244 = fma(_242, _160, _232);
    float _246 = -_144;
    float _248 = -_234;
    float _250 = fma(_172, _246, _248);
    float _252 = fma(_80, _138, _238);
    float _254 = exp2(_220);
    float _256 = -_146;
    float _258 = fma(_80, _256, _250);
    float _260 = precise::min(_252, _258);
    float _262 = 1.0 / _244;
    float _264 = _214 * _260;
    float _266 = _264 * 2.0;
    float _268 = exp2(_240);
    float _270 = _266 * _262;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _68 * _228;
    float _276 = exp2(_274);
    float _278 = -_126;
    float _280 = fma(_278, (*spvDescriptorSet0.fp_c4)._m0[12].z, 1.0);
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _254 * _282;
    float _286 = _268 * _254;
    float _288 = _276 * _284;
    float _290 = -_132;
    float _292 = fma(_290, _206, 0.0);
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = _272 * _288;
    float _298 = _294 * _286;
    float _300 = _70 * _296;
    float _302 = _298 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _304 = _298 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _306 = _298 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _308 = _178 * _300;
    float _310 = _308 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _312 = _308 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _314 = _308 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    out.m_38.x = _302;
    out.m_38.y = _304;
    out.m_38.z = _306;
    out.m_40.x = _310;
    out.m_40.y = _312;
    out.m_40.z = _314;
    return out;
}

