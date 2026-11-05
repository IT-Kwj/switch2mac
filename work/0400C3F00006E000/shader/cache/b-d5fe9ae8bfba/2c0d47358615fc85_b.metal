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
int _38(thread const int& _836, thread const int& _837, constant _10& support_buffer)
{
    int _840 = 1 + _837;
    float _842 = support_buffer._m5[_840].x;
    float _844 = abs(_842);
    bool _847 = _844 == 1.0;
    if (_847)
    {
        return _836;
    }
    float _849 = float(_836);
    float _851 = _849 / _844;
    int _853 = int(_851);
    return _853;
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
    float _78 = in.m_29.w;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _58;
    float _86 = _84 * _64;
    float _88 = float(_47);
    float _90 = _84 * _70;
    float _92 = float(_55);
    float _94 = fma(_86, _88, -0.5);
    float _96 = fma(_90, _92, -0.5);
    float _98 = floor(_94);
    float _100 = floor(_96);
    float _102 = -_98;
    float _104 = _94 + _102;
    float _106 = -_104;
    float _108 = _106 + 1.0;
    float _110 = -_104;
    float _112 = _110 + 2.0;
    float _114 = -_100;
    float _116 = _96 + _114;
    float _118 = _108 * _108;
    float _120 = _112 * _112;
    float _122 = -_116;
    float _124 = _122 + 1.0;
    float _126 = _108 * _118;
    float _128 = 1.0 / _88;
    float _130 = _124 * _124;
    float _132 = _126 * 4.0;
    float _134 = -_126;
    float _136 = _134 + 6.0;
    float _138 = _124 * _130;
    float _140 = -_116;
    float _142 = _140 + 2.0;
    float _144 = -_132;
    float _146 = fma(_112, _120, _144);
    float _148 = _138 * 4.0;
    float _150 = _142 * _142;
    float _152 = -_146;
    float _154 = _152 + _136;
    float _156 = 1.0 / _92;
    float _158 = -_148;
    float _160 = fma(_142, _150, _158);
    float _162 = -_138;
    float _164 = _162 + 6.0;
    float _166 = _154 * 0.16666667163372039794921875;
    float _168 = _116 * _116;
    float _170 = _138 + _160;
    float _172 = -_160;
    float _174 = _172 + _164;
    float _176 = _104 * _104;
    float _178 = 1.0 / _166;
    float _180 = _170 * 0.16666667163372039794921875;
    float _182 = _174 * 0.16666667163372039794921875;
    float _184 = _126 + _146;
    float _186 = _84 * _76;
    float _188 = _116 * _168;
    float _190 = _104 * _176;
    float _192 = _184 * 0.16666667163372039794921875;
    float _194 = 1.0 / _182;
    float _196 = _100 + (-0.5);
    float _198 = _98 + 1.5;
    float _200 = _100 + 1.5;
    float _202 = _190 * 0.16666667163372039794921875;
    float _204 = _188 * 0.16666667163372039794921875;
    float _206 = _160 * 0.16666667163372039794921875;
    float _208 = _98 + (-0.5);
    float _210 = 1.0 / _180;
    float _212 = _146 * 0.16666667163372039794921875;
    float _214 = fma(_202, _178, _198);
    float _216 = _84 * _82;
    float _218 = _214 * _128;
    float _220 = 1.0 / _192;
    float _222 = fma(_204, _194, _200);
    float _224 = rint(_186);
    float _226 = precise::max(_224, 0.0);
    uint _229 = uint(_226);
    uint _231 = clamp(_229, 0u, 65535u);
    float _233 = fma(_206, _210, _196);
    float _235 = _233 * _156;
    float _237 = fma(_212, _220, _208);
    float _239 = _222 * _156;
    float _241 = _237 * _128;
    float3 _625 = float3(_218, _235, float(int(_231)));
    float3 _630 = select(_625, float3(0.0), isnan(_625));
    float4 _244 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _630.xy, uint(rint(_630.z)), level(_216)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _630.xy, uint(rint(_630.z)), level(_216)).xyzw;
    float _246 = _244.x;
    float _248 = _244.y;
    float _250 = _244.z;
    float _252 = _244.w;
    float3 _648 = float3(_241, _235, float(int(_231)));
    float3 _650 = select(_648, float3(0.0), isnan(_648));
    float4 _254 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _650.xy, uint(rint(_650.z)), level(_216)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _650.xy, uint(rint(_650.z)), level(_216)).xyzw;
    float _256 = _254.x;
    float _258 = _254.y;
    float _260 = _254.z;
    float _262 = _254.w;
    float3 _668 = float3(_241, _239, float(int(_231)));
    float3 _670 = select(_668, float3(0.0), isnan(_668));
    float4 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _670.xy, uint(rint(_670.z)), level(_216)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _670.xy, uint(rint(_670.z)), level(_216)).xyzw;
    float _266 = _264.x;
    float _268 = _264.y;
    float _270 = _264.z;
    float _272 = _264.w;
    float3 _688 = float3(_218, _239, float(int(_231)));
    float3 _690 = select(_688, float3(0.0), isnan(_688));
    float4 _274 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _690.xy, uint(rint(_690.z)), level(_216)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _690.xy, uint(rint(_690.z)), level(_216)).xyzw;
    float _276 = _274.x;
    float _278 = _274.y;
    float _280 = _274.z;
    float _282 = _274.w;
    float _284 = -_248;
    float _286 = _258 + _284;
    float _288 = -_246;
    float _290 = _256 + _288;
    float _292 = -_250;
    float _294 = _260 + _292;
    float _296 = -_252;
    float _298 = _262 + _296;
    float _300 = fma(_192, _286, _248);
    float _302 = -_276;
    float _304 = _266 + _302;
    float _306 = -_278;
    float _308 = _268 + _306;
    float _310 = -_280;
    float _312 = _270 + _310;
    float _314 = -_282;
    float _316 = _272 + _314;
    float _318 = fma(_192, _290, _246);
    float _320 = fma(_192, _294, _250);
    float _322 = fma(_192, _298, _252);
    float _324 = fma(_192, _304, _276);
    float _326 = fma(_192, _308, _278);
    float _328 = fma(_192, _312, _280);
    float _330 = fma(_192, _316, _282);
    float _332 = -_324;
    float _334 = _332 + _318;
    float _336 = -_326;
    float _338 = _336 + _300;
    float _340 = -_328;
    float _342 = _340 + _320;
    float _344 = -_330;
    float _346 = _344 + _322;
    float _348 = fma(_180, _334, _324);
    float _350 = fma(_180, _338, _326);
    float _352 = fma(_180, _342, _328);
    float _354 = fma(_180, _346, _330);
    float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_32.x = _356;
    out.m_32.y = _358;
    out.m_32.z = _360;
    out.m_32.w = _362;
    return out;
}

