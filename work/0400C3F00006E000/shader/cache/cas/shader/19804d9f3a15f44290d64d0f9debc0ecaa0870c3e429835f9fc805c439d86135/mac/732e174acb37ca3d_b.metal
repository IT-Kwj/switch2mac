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
    float2 _295 = float2(_47, _49);
    float4 _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_295, float2(0.0), isnan(_295))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_295, float2(0.0), isnan(_295))).xyzw;
    float _54 = _52.x;
    float _56 = _52.y;
    float _58 = _52.z;
    float _60 = _52.w;
    float2 _315 = float2(_47, _49);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_315, float2(0.0), isnan(_315))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_315, float2(0.0), isnan(_315))).x;
    float2 _322 = float2(_60, 0.0);
    float2 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_322, float2(0.0), isnan(_322))).xy;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = in.m_35.y;
    float _74 = in.m_35.x;
    float _76 = in.m_35.z;
    float _78 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _80 = _72 * _72;
    float _82 = -_78;
    float _84 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _86 = fma(_82, _72, _84);
    float _88 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _90 = _72 + _88;
    float _92 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _94 = _74 + _92;
    float _96 = fma(_74, _74, _80);
    float _98 = _86 * _86;
    float _100 = _90 * _90;
    float _102 = _96 + 1.0;
    float _104 = -_78;
    float _106 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _108 = fma(_104, _74, _106);
    float _110 = -_78;
    float _112 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _114 = fma(_110, _76, _112);
    float _116 = fma(_94, _94, _100);
    float _118 = fma(_108, _108, _98);
    float _120 = rsqrt(_102);
    float _122 = fma(_114, _114, _118);
    float _124 = rsqrt(_122);
    float _126 = _72 * _120;
    float _128 = _74 * _120;
    float _130 = _76 * _120;
    float _132 = sqrt(_122);
    float _134 = -_126;
    float _136 = fma(_86, _124, _134);
    float _138 = _114 * _124;
    float _140 = -_128;
    float _142 = fma(_108, _124, _140);
    float _144 = _136 * _136;
    float _146 = -_130;
    float _148 = _138 + _146;
    float _150 = 0.0 + _138;
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = fma(_142, _142, _144);
    float _156 = fma(_56, 2.0, -1.0);
    float _158 = fma(_54, 2.0, -1.0);
    float _160 = fma(_58, 2.0, -1.0);
    float _162 = fma(_148, _148, _154);
    float _164 = _156 * _136;
    float _166 = -_132;
    float _168 = fma(_166, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = -_158;
    float _174 = -_164;
    float _176 = fma(_172, _142, _174);
    float _178 = rsqrt(_162);
    float _180 = -_160;
    float _182 = fma(_180, _148, _176);
    float _184 = -_136;
    float _186 = _126 * _184;
    float _188 = -_126;
    float _190 = _156 * _188;
    float _192 = -_128;
    float _194 = fma(_192, _142, _186);
    float _196 = abs(_170);
    float _198 = log2(_196);
    float _200 = _156 * _86;
    float _202 = -_130;
    float _204 = fma(_202, _148, _194);
    float _206 = fma(_158, _108, _200);
    float _208 = -_190;
    float _210 = fma(_158, _128, _208);
    float _212 = _178 * _182;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = 1.0 / _204;
    float _218 = fma(_160, _114, _206);
    float _220 = fma(_160, _130, _210);
    float _222 = -_170;
    float _224 = _222 + 1.0;
    float _226 = -_116;
    float _228 = fma(_226, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = -_218;
    float _234 = _124 * _232;
    float _236 = fma(_224, _152, _170);
    float _238 = abs(_214);
    float _240 = log2(_238);
    float _242 = _198 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _244 = precise::min(_234, _220);
    float _246 = _230 * _236;
    float _248 = 0.0 + _234;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = _214 * _244;
    float _254 = _252 * 2.0;
    float _256 = exp2(_242);
    float _258 = _254 * _216;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _260 * _246;
    float _264 = _256 * _250;
    float _266 = _68 * _240;
    float _268 = _70 * _262;
    float _270 = _264 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _272 = _264 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _274 = _264 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _276 = exp2(_266);
    float _278 = _276 * _268;
    float _280 = _278 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _282 = _278 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _284 = _278 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    out.m_38.x = _270;
    out.m_38.y = _272;
    out.m_38.z = _274;
    out.m_40.x = _280;
    out.m_40.y = _282;
    out.m_40.z = _284;
    return out;
}

