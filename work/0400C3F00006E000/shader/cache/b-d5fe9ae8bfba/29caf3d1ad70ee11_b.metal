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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _302 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_302, float2(0.0), isnan(_302))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_302, float2(0.0), isnan(_302))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float2 _321 = float2(_57, _59);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_321, float2(0.0), isnan(_321)), int2(0), component::x).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _84 = precise::min(_74, _80);
    float _86 = precise::min(_76, _78);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _82);
    float _90 = precise::max(_74, _80);
    float _92 = precise::max(_76, _78);
    float _94 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _96 = precise::min(_84, _86);
    float _98 = precise::max(_90, _92);
    float _100 = precise::min(_94, _96);
    float _102 = precise::max(_94, _98);
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _106 = -_100;
    float _108 = _106 + _102;
    float _110 = precise::max(_104, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _114 = _108 > _110;
    if (!_114)
    {
        out.m_34.x = _64;
        out.m_34.y = _66;
        out.m_34.z = _68;
        out.m_34.w = _70;
        return out;
    }
    float _116 = _78 + _80;
    float _118 = -_78;
    float _120 = _74 + _118;
    float _122 = -_80;
    float _124 = _76 + _122;
    float _126 = _74 + _116;
    float _128 = _120 + _124;
    float _130 = -_124;
    float _132 = _120 + _130;
    float _134 = _76 + _126;
    float _136 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
    float _138 = abs(_128);
    float _140 = abs(_132);
    float _142 = precise::min(_138, _140);
    float _144 = fma(_134, _136, (*spvDescriptorSet0.fp_c3)._m0[4].w);
    float _146 = precise::max(_144, _142);
    float _148 = 1.0 / _146;
    float _150 = _128 * _148;
    float _152 = _132 * _148;
    float _154 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _156 = precise::max(_150, _154);
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _160 = precise::max(_152, _158);
    float _162 = precise::min(_156, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _164 = precise::min(_160, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _166 = -_162;
    float _168 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[1].x, _57);
    float _170 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[1].x, _57);
    float _172 = -_164;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[1].y, _59);
    float _176 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[1].y, _59);
    float2 _506 = float2(_168, _174);
    float4 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_506, float2(0.0), isnan(_506))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_506, float2(0.0), isnan(_506))).xyzw;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float _186 = _178.w;
    float2 _522 = float2(_170, _176);
    float4 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_522, float2(0.0), isnan(_522))).xyzw;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = _188.w;
    float _198 = -_182;
    float _200 = _198 + _192;
    float _202 = -_184;
    float _204 = _202 + _194;
    float _206 = -_180;
    float _208 = _206 + _190;
    float _210 = -_186;
    float _212 = _210 + _196;
    float _214 = fma(_200, 0.5, _182);
    float _216 = fma(_204, 0.5, _184);
    float _218 = fma(_208, 0.5, _180);
    float _220 = fma(_212, 0.5, _186);
    float _222 = -_214;
    float _224 = _66 + _222;
    float _226 = -_216;
    float _228 = _68 + _226;
    float _230 = -_218;
    float _232 = _64 + _230;
    float _234 = -_220;
    float _236 = _70 + _234;
    float _238 = fma(_224, 0.3499999940395355224609375, _214);
    float _240 = fma(_228, 0.3499999940395355224609375, _216);
    float _242 = fma(_232, 0.3499999940395355224609375, _218);
    float _244 = fma(_236, 0.3499999940395355224609375, _220);
    float _246 = -_238;
    float _248 = _66 + _246;
    float _250 = -_240;
    float _252 = _68 + _250;
    float _254 = -_242;
    float _256 = _64 + _254;
    float _258 = -_244;
    float _260 = _70 + _258;
    float _262 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[5].x, _238);
    float _264 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[5].x, _240);
    float _266 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[5].x, _242);
    float _268 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[5].x, _244);
    out.m_34.x = _266;
    out.m_34.y = _262;
    out.m_34.z = _264;
    out.m_34.w = _268;
    return out;
}

