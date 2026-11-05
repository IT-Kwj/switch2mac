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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _965, thread const int& _966, constant _10& support_buffer)
{
    int _969 = 1 + _966;
    float _971 = support_buffer._m5[_969].x;
    float _973 = abs(_971);
    bool _975 = _973 == 1.0;
    if (_975)
    {
        return _965;
    }
    float _977 = float(_965);
    float _979 = _977 / _973;
    int _981 = int(_979);
    return _981;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _448 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).x;
    float _68 = in.m_33.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = precise::max(_94, _90);
    float _102 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    bool _108 = _100 != 0.0;
    bool _110 = isnan(_100);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    float _118 = precise::min(_98, _104);
    bool _120 = !_116;
    if (!_120)
    {
        float _122 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _124 = fma(_100, _122, 1.0);
        float _126 = log2(_124);
        float _128 = _126 + (-1.0);
        float _130 = trunc(_128);
        int _132 = int(_130);
        int _134 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_132), spvDescriptorSet0.fp_t_tcb_A.get_height(_132)).x;
        int _136 = _134;
        int _138 = 1;
        int _140 = _42(_136, _138, (*spvDescriptorSet0.support_buffer));
        int _142 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_132), spvDescriptorSet0.fp_t_tcb_A.get_height(_132)).y;
        int _144 = _142;
        int _146 = 1;
        int _148 = _42(_144, _146, (*spvDescriptorSet0.support_buffer));
        float _150 = float(_148);
        float _152 = float(_140);
        float _154 = fma(_64, _150, -0.5);
        float _156 = fma(_62, _152, -0.5);
        float _158 = floor(_154);
        float _160 = floor(_156);
        float _162 = -_158;
        float _164 = _154 + _162;
        float _166 = -_164;
        float _168 = _166 + 1.0;
        float _170 = _164 * _164;
        float _172 = -_160;
        float _174 = _156 + _172;
        float _176 = _168 * _168;
        float _178 = _164 * _170;
        float _180 = -_174;
        float _182 = _180 + 1.0;
        float _184 = _168 * _176;
        float _186 = -_174;
        float _188 = _186 + 2.0;
        float _190 = -_164;
        float _192 = _190 + 2.0;
        float _194 = _182 * _182;
        float _196 = _184 * 4.0;
        float _198 = _188 * _188;
        float _200 = _192 * _192;
        float _202 = _182 * _194;
        float _204 = _160 + (-0.5);
        float _206 = _160 + 1.5;
        float _208 = -_196;
        float _210 = fma(_192, _200, _208);
        float _212 = _202 * 4.0;
        float _214 = -_202;
        float _216 = _214 + 6.0;
        float _218 = -_184;
        float _220 = _218 + 6.0;
        float _222 = 1.0 / _152;
        float _224 = -_212;
        float _226 = fma(_188, _198, _224);
        float _228 = _184 + _210;
        float _230 = -_210;
        float _232 = _230 + _220;
        float _234 = _210 * 0.16666667163372039794921875;
        float _236 = -_226;
        float _238 = _236 + _216;
        float _240 = _202 + _226;
        float _242 = _228 * 0.16666667163372039794921875;
        float _244 = _232 * 0.16666667163372039794921875;
        float _246 = _238 * 0.16666667163372039794921875;
        float _248 = _240 * 0.16666667163372039794921875;
        float _250 = 1.0 / _242;
        float _252 = _158 + 1.5;
        float _254 = _226 * 0.16666667163372039794921875;
        float _256 = _178 * 0.16666667163372039794921875;
        float _258 = 1.0 / _248;
        float _260 = 1.0 / _246;
        float _262 = 1.0 / _244;
        float _264 = fma(_254, _258, _204);
        float _266 = _264 * _222;
        float _268 = 1.0 / _150;
        float _270 = _158 + (-0.5);
        float _272 = fma(_234, _250, _270);
        float _274 = fma(_256, _262, _252);
        float _276 = _174 * _174;
        float _278 = _174 * _276;
        float _280 = _278 * 0.16666667163372039794921875;
        float _282 = fma(_280, _260, _206);
        float _284 = _272 * _268;
        float _286 = _274 * _268;
        float _288 = _282 * _222;
        float2 _750 = float2(_266, _284);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_750, float2(0.0), isnan(_750)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_750, float2(0.0), isnan(_750)), level(_128)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float2 _765 = float2(_288, _284);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_765, float2(0.0), isnan(_765)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_765, float2(0.0), isnan(_765)), level(_128)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _780 = float2(_266, _286);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_780, float2(0.0), isnan(_780)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_780, float2(0.0), isnan(_780)), level(_128)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float2 _795 = float2(_288, _286);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_795, float2(0.0), isnan(_795)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_795, float2(0.0), isnan(_795)), level(_128)).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float _324 = 0.0 + _126;
        float _326 = precise::clamp(_324, 0.0, 1.0);
        float _328 = fma(_88, _326, _86);
        float _330 = _326 * _88;
        float _332 = -_306;
        float _334 = _298 + _332;
        float _336 = -_302;
        float _338 = _294 + _336;
        float _340 = -_304;
        float _342 = _296 + _340;
        float _344 = -_322;
        float _346 = _314 + _344;
        float _348 = -_318;
        float _350 = _310 + _348;
        float _352 = fma(_248, _334, _306);
        float _354 = -_320;
        float _356 = _312 + _354;
        float _358 = fma(_248, _346, _322);
        float _360 = fma(_248, _338, _302);
        float _362 = fma(_248, _350, _318);
        float _364 = 1.0 / _328;
        float _366 = fma(_248, _342, _304);
        float _368 = fma(_248, _356, _320);
        float _370 = -_358;
        float _372 = _370 + _352;
        float _374 = -_362;
        float _376 = _374 + _360;
        float _378 = -_368;
        float _380 = _378 + _366;
        float _382 = fma(_242, _372, _358);
        float _384 = fma(_242, _376, _362);
        float _386 = fma(_242, _380, _368);
        float _388 = -_382;
        float _390 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[13].z, _388);
        float _392 = -_384;
        float _394 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[13].x, _392);
        float _396 = -_386;
        float _398 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[13].y, _396);
        float _400 = fma(_118, _390, _382);
        float _402 = fma(_118, _394, _384);
        float _404 = _364 * _330;
        float _406 = fma(_118, _398, _386);
        float _408 = _400 * _330;
        float _410 = _402 * _404;
        float _412 = _406 * _404;
        float _414 = _408 * _364;
        out.m_36.x = _410;
        out.m_36.y = _412;
        out.m_36.z = _414;
        out.m_36.w = _328;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _86;
    return out;
}

