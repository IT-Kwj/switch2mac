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

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d_array<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _38(thread const int& _814, thread const int& _815, constant _10& support_buffer)
{
    int _818 = 1 + _815;
    float _820 = support_buffer._m5[_818].x;
    float _822 = abs(_820);
    bool _825 = _822 == 1.0;
    if (_825)
    {
        return _814;
    }
    float _827 = float(_814);
    float _829 = _827 / _822;
    int _831 = int(_829);
    return _831;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _41 = int3(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height(), spvDescriptorSet0.fp_t_tcb_8.get_array_size()).x;
    int _43 = _41;
    int _45 = 0;
    int _47 = _38(_43, _45, (*spvDescriptorSet0.support_buffer));
    int _49 = int3(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height(), spvDescriptorSet0.fp_t_tcb_8.get_array_size()).y;
    int _51 = _49;
    int _53 = 0;
    int _55 = _38(_51, _53, (*spvDescriptorSet0.support_buffer));
    float _58 = gl_FragCoord.w;
    float _60 = in.m_29.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_29.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_29.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _58;
    float _80 = float(_47);
    float _82 = _78 * _64;
    float _84 = float(_55);
    float _86 = _78 * _70;
    float _88 = _78 * _76;
    float _90 = fma(_82, _80, -0.5);
    float _92 = fma(_86, _84, -0.5);
    float _94 = 1.0 / _80;
    float _96 = floor(_90);
    float _98 = floor(_92);
    float _100 = -_96;
    float _102 = _90 + _100;
    float _104 = 1.0 / _84;
    float _106 = -_102;
    float _108 = _106 + 1.0;
    float _110 = -_102;
    float _112 = _110 + 2.0;
    float _114 = -_98;
    float _116 = _92 + _114;
    float _118 = _108 * _108;
    float _120 = _112 * _112;
    float _122 = -_116;
    float _124 = _122 + 1.0;
    float _126 = _108 * _118;
    float _128 = -_116;
    float _130 = _128 + 2.0;
    float _132 = _124 * _124;
    float _134 = _130 * _130;
    float _136 = _124 * _132;
    float _138 = _126 * 4.0;
    float _140 = _136 * 4.0;
    float _142 = -_138;
    float _144 = fma(_112, _120, _142);
    float _146 = -_126;
    float _148 = _146 + 6.0;
    float _150 = -_136;
    float _152 = _150 + 6.0;
    float _154 = -_140;
    float _156 = fma(_130, _134, _154);
    float _158 = _126 + _144;
    float _160 = -_144;
    float _162 = _160 + _148;
    float _164 = _116 * _116;
    float _166 = -_156;
    float _168 = _166 + _152;
    float _170 = _158 * 0.16666667163372039794921875;
    float _172 = _162 * 0.16666667163372039794921875;
    float _174 = _136 + _156;
    float _176 = _168 * 0.16666667163372039794921875;
    float _178 = _102 * _102;
    float _180 = 1.0 / _172;
    float _182 = _174 * 0.16666667163372039794921875;
    float _184 = _116 * _164;
    float _186 = _102 * _178;
    float _188 = _96 + (-0.5);
    float _190 = _156 * 0.16666667163372039794921875;
    float _192 = _184 * 0.16666667163372039794921875;
    float _194 = _186 * 0.16666667163372039794921875;
    float _196 = 1.0 / _182;
    float _198 = _98 + 1.5;
    float _200 = _144 * 0.16666667163372039794921875;
    float _202 = 1.0 / _176;
    float _204 = 1.0 / _170;
    float _206 = _96 + 1.5;
    float _208 = _98 + (-0.5);
    float _210 = fma(_194, _180, _206);
    float _212 = fma(_190, _196, _208);
    float _214 = rint(_88);
    float _216 = precise::max(_214, 0.0);
    uint _219 = uint(_216);
    uint _221 = clamp(_219, 0u, 65535u);
    float _223 = fma(_192, _202, _198);
    float _225 = fma(_200, _204, _188);
    float _227 = _212 * _104;
    float _229 = _210 * _94;
    float _231 = _223 * _104;
    float _233 = _225 * _94;
    float3 _607 = float3(_229, _227, float(int(_221)));
    float3 _612 = select(_607, float3(0.0), isnan(_607));
    float4 _236 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _612.xy, uint(rint(_612.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _612.xy, uint(rint(_612.z))).xyzw;
    float _238 = _236.x;
    float _240 = _236.y;
    float _242 = _236.z;
    float _244 = _236.w;
    float3 _629 = float3(_233, _227, float(int(_221)));
    float3 _631 = select(_629, float3(0.0), isnan(_629));
    float4 _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _631.xy, uint(rint(_631.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _631.xy, uint(rint(_631.z))).xyzw;
    float _248 = _246.x;
    float _250 = _246.y;
    float _252 = _246.z;
    float _254 = _246.w;
    float3 _648 = float3(_233, _231, float(int(_221)));
    float3 _650 = select(_648, float3(0.0), isnan(_648));
    float4 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _650.xy, uint(rint(_650.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _650.xy, uint(rint(_650.z))).xyzw;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = _256.w;
    float3 _667 = float3(_229, _231, float(int(_221)));
    float3 _669 = select(_667, float3(0.0), isnan(_667));
    float4 _266 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _669.xy, uint(rint(_669.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _669.xy, uint(rint(_669.z))).xyzw;
    float _268 = _266.x;
    float _270 = _266.y;
    float _272 = _266.z;
    float _274 = _266.w;
    float _276 = -_240;
    float _278 = _250 + _276;
    float _280 = -_238;
    float _282 = _248 + _280;
    float _284 = -_270;
    float _286 = _260 + _284;
    float _288 = -_242;
    float _290 = _252 + _288;
    float _292 = -_268;
    float _294 = _258 + _292;
    float _296 = -_272;
    float _298 = _262 + _296;
    float _300 = -_244;
    float _302 = _254 + _300;
    float _304 = -_274;
    float _306 = _264 + _304;
    float _308 = fma(_170, _278, _240);
    float _310 = fma(_170, _286, _270);
    float _312 = fma(_170, _282, _238);
    float _314 = fma(_170, _290, _242);
    float _316 = fma(_170, _294, _268);
    float _318 = fma(_170, _298, _272);
    float _320 = fma(_170, _302, _244);
    float _322 = fma(_170, _306, _274);
    float _324 = -_310;
    float _326 = _324 + _308;
    float _328 = -_316;
    float _330 = _328 + _312;
    float _332 = -_318;
    float _334 = _332 + _314;
    float _336 = -_322;
    float _338 = _336 + _320;
    float _340 = fma(_182, _326, _310);
    float _342 = fma(_182, _330, _316);
    float _344 = fma(_182, _334, _318);
    float _346 = fma(_182, _338, _322);
    float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_32.x = _350;
    out.m_32.y = _348;
    out.m_32.z = _352;
    out.m_32.w = _354;
    return out;
}

