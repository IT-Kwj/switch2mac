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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _931, thread const int& _932, constant _10& support_buffer)
{
    int _935 = 1 + _932;
    float _937 = support_buffer._m5[_935].x;
    float _939 = abs(_937);
    bool _942 = _939 == 1.0;
    if (_942)
    {
        return _931;
    }
    float _944 = float(_931);
    float _946 = _944 / _939;
    int _948 = int(_946);
    return _948;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _43 = int3(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height(), spvDescriptorSet0.fp_t_tcb_8.get_array_size()).x;
    int _45 = _43;
    int _47 = 0;
    int _49 = _40(_45, _47, (*spvDescriptorSet0.support_buffer));
    int _51 = int3(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height(), spvDescriptorSet0.fp_t_tcb_8.get_array_size()).y;
    int _53 = _51;
    int _55 = 0;
    int _57 = _40(_53, _55, (*spvDescriptorSet0.support_buffer));
    float _60 = gl_FragCoord.w;
    float _62 = in.m_31.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_31.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_31.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_31.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _60;
    float _88 = _86 * _66;
    float _90 = float(_49);
    float _92 = _86 * _72;
    float _94 = float(_57);
    float _96 = fma(_88, _90, -0.5);
    float _98 = fma(_92, _94, -0.5);
    float _100 = 1.0 / _90;
    float _102 = floor(_96);
    float _104 = floor(_98);
    float _106 = -_102;
    float _108 = _96 + _106;
    float _110 = -_108;
    float _112 = _110 + 1.0;
    float _114 = -_108;
    float _116 = _114 + 2.0;
    float _118 = _108 * _108;
    float _120 = -_104;
    float _122 = _98 + _120;
    float _124 = _112 * _112;
    float _126 = _116 * _116;
    float _128 = _108 * _118;
    float _130 = -_122;
    float _132 = _130 + 1.0;
    float _134 = _112 * _124;
    float _136 = _102 + 1.5;
    float _138 = _128 * 0.16666667163372039794921875;
    float _140 = _132 * _132;
    float _142 = _134 * 4.0;
    float _144 = -_134;
    float _146 = _144 + 6.0;
    float _148 = _132 * _140;
    float _150 = -_122;
    float _152 = _150 + 2.0;
    float _154 = -_142;
    float _156 = fma(_116, _126, _154);
    float _158 = _148 * 4.0;
    float _160 = _152 * _152;
    float _162 = -_156;
    float _164 = _162 + _146;
    float _166 = -_158;
    float _168 = fma(_152, _160, _166);
    float _170 = -_148;
    float _172 = _170 + 6.0;
    float _174 = _164 * 0.16666667163372039794921875;
    float _176 = 1.0 / _94;
    float _178 = _148 + _168;
    float _180 = -_168;
    float _182 = _180 + _172;
    float _184 = _122 * _122;
    float _186 = _168 * 0.16666667163372039794921875;
    float _188 = _182 * 0.16666667163372039794921875;
    float _190 = _134 + _156;
    float _192 = 1.0 / _174;
    float _194 = _178 * 0.16666667163372039794921875;
    float _196 = _86 * _78;
    float _198 = _190 * 0.16666667163372039794921875;
    float _200 = _122 * _184;
    float _202 = _156 * 0.16666667163372039794921875;
    float _204 = _86 * _84;
    float _206 = 1.0 / _198;
    float _208 = _102 + (-0.5);
    float _210 = _104 + 1.5;
    float _212 = _200 * 0.16666667163372039794921875;
    float _214 = 1.0 / _188;
    float _216 = fma(_138, _192, _136);
    float _218 = 1.0 / _194;
    float _220 = _104 + (-0.5);
    float _222 = fma(_202, _206, _208);
    float _224 = _222 * _100;
    float _226 = _216 * _100;
    float _228 = rint(_196);
    float _230 = precise::max(_228, 0.0);
    uint _233 = uint(_230);
    uint _235 = clamp(_233, 0u, 65535u);
    float _237 = fma(_212, _214, _210);
    float _239 = _237 * _176;
    float _241 = fma(_186, _218, _220);
    float _243 = _241 * _176;
    float3 _653 = float3(_226, _243, float(int(_235)));
    float3 _658 = select(_653, float3(0.0), isnan(_653));
    float4 _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _658.xy, uint(rint(_658.z)), level(_204)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _658.xy, uint(rint(_658.z)), level(_204)).xyzw;
    float _248 = _246.x;
    float _250 = _246.y;
    float _252 = _246.z;
    float _254 = _246.w;
    float3 _676 = float3(_224, _243, float(int(_235)));
    float3 _678 = select(_676, float3(0.0), isnan(_676));
    float4 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _678.xy, uint(rint(_678.z)), level(_204)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _678.xy, uint(rint(_678.z)), level(_204)).xyzw;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = _256.w;
    float3 _696 = float3(_224, _239, float(int(_235)));
    float3 _698 = select(_696, float3(0.0), isnan(_696));
    float4 _266 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _698.xy, uint(rint(_698.z)), level(_204)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _698.xy, uint(rint(_698.z)), level(_204)).xyzw;
    float _268 = _266.x;
    float _270 = _266.y;
    float _272 = _266.z;
    float _274 = _266.w;
    float3 _716 = float3(_226, _239, float(int(_235)));
    float3 _718 = select(_716, float3(0.0), isnan(_716));
    float4 _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _718.xy, uint(rint(_718.z)), level(_204)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _718.xy, uint(rint(_718.z)), level(_204)).xyzw;
    float _278 = _276.x;
    float _280 = _276.y;
    float _282 = _276.z;
    float _284 = _276.w;
    float3 _736 = float3(_88, _92, float(int(_235)));
    float3 _738 = select(_736, float3(0.0), isnan(_736));
    float4 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _738.xy, uint(rint(_738.z)), level(_204)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _738.xy, uint(rint(_738.z)), level(_204)).xyzw;
    float _288 = _286.x;
    float _290 = _286.y;
    float _292 = _286.z;
    float _294 = _286.w;
    float _296 = -_248;
    float _298 = _258 + _296;
    float _300 = -_250;
    float _302 = _260 + _300;
    float _304 = -_280;
    float _306 = _270 + _304;
    float _308 = -_252;
    float _310 = _262 + _308;
    float _312 = -_254;
    float _314 = _264 + _312;
    float _316 = fma(_198, _302, _250);
    float _318 = -_278;
    float _320 = _268 + _318;
    float _322 = -_282;
    float _324 = _272 + _322;
    float _326 = fma(_198, _306, _280);
    float _328 = -_284;
    float _330 = _274 + _328;
    float _332 = fma(_198, _298, _248);
    float _334 = fma(_198, _310, _252);
    float _336 = fma(_198, _314, _254);
    float _338 = fma(_198, _320, _278);
    float _340 = fma(_198, _324, _282);
    float _342 = -_326;
    float _344 = _342 + _316;
    float _346 = fma(_198, _330, _284);
    float _348 = -_338;
    float _350 = _348 + _332;
    float _352 = fma(_194, _344, _326);
    float _354 = -_346;
    float _356 = _354 + _336;
    float _358 = -_340;
    float _360 = _358 + _334;
    float _362 = fma(_194, _356, _346);
    float _364 = fma(_194, _350, _338);
    float _366 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _368 = fma(_194, _360, _340);
    float _370 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _372 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    float _374 = fma(_294, (*spvDescriptorSet0.fp_c3)._m0[6].w, (*spvDescriptorSet0.fp_c3)._m0[7].w);
    float _376 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[5].y, _366);
    float _378 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[5].x, _370);
    float _380 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[5].z, _372);
    float _382 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[5].w, _374);
    float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_34.x = _386;
    out.m_34.y = _384;
    out.m_34.z = _388;
    out.m_34.w = _390;
    return out;
}

