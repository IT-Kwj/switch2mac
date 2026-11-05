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
int _42(thread const int& _1020, thread const int& _1021, constant _10& support_buffer)
{
    int _1024 = 1 + _1021;
    float _1026 = support_buffer._m5[_1024].x;
    float _1028 = abs(_1026);
    bool _1030 = _1028 == 1.0;
    if (_1030)
    {
        return _1020;
    }
    float _1032 = float(_1020);
    float _1034 = _1032 / _1028;
    int _1036 = int(_1034);
    return _1036;
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
    float2 _466 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_466, float2(0.0), isnan(_466))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_466, float2(0.0), isnan(_466))).x;
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
    float _96 = precise::max(_94, _90);
    bool _100 = _96 != 0.0;
    bool _102 = isnan(_96);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.0);
    bool _108 = _104 || _106;
    float _110 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = precise::min(_112, _116);
    bool _120 = !_108;
    if (!_120)
    {
        float _122 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _124 = fma(_96, _122, 1.0);
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
        float _150 = float(_140);
        float _152 = float(_148);
        float _154 = fma(_62, _150, -0.5);
        float _156 = fma(_64, _152, -0.5);
        float _158 = 1.0 / _150;
        float _160 = floor(_154);
        float _162 = floor(_156);
        float _164 = -_160;
        float _166 = _154 + _164;
        float _168 = -_166;
        float _170 = _168 + 1.0;
        float _172 = -_166;
        float _174 = _172 + 2.0;
        float _176 = -_162;
        float _178 = _156 + _176;
        float _180 = _170 * _170;
        float _182 = _174 * _174;
        float _184 = -_178;
        float _186 = _184 + 1.0;
        float _188 = _170 * _180;
        float _190 = -_178;
        float _192 = _190 + 2.0;
        float _194 = _186 * _186;
        float _196 = -_188;
        float _198 = _196 + 6.0;
        float _200 = _192 * _192;
        float _202 = _186 * _194;
        float _204 = _188 * 4.0;
        float _206 = _202 * 4.0;
        float _208 = -_204;
        float _210 = fma(_174, _182, _208);
        float _212 = -_202;
        float _214 = _212 + 6.0;
        float _216 = 1.0 / _152;
        float _218 = -_206;
        float _220 = fma(_192, _200, _218);
        float _222 = _188 + _210;
        float _224 = -_210;
        float _226 = _224 + _198;
        float _228 = _210 * 0.16666667163372039794921875;
        float _230 = _202 + _220;
        float _232 = -_220;
        float _234 = _232 + _214;
        float _236 = _222 * 0.16666667163372039794921875;
        float _238 = _226 * 0.16666667163372039794921875;
        float _240 = _230 * 0.16666667163372039794921875;
        float _242 = _234 * 0.16666667163372039794921875;
        float _244 = 1.0 / _236;
        float _246 = _166 * _166;
        float _248 = _178 * _178;
        float _250 = _220 * 0.16666667163372039794921875;
        float _252 = _166 * _246;
        float _254 = _178 * _248;
        float _256 = _162 + (-0.5);
        float _258 = 1.0 / _240;
        float _260 = _160 + (-0.5);
        float _262 = _162 + 1.5;
        float _264 = _254 * 0.16666667163372039794921875;
        float _266 = _160 + 1.5;
        float _268 = _252 * 0.16666667163372039794921875;
        float _270 = 1.0 / _242;
        float _272 = fma(_228, _244, _260);
        float _274 = 1.0 / _238;
        float _276 = fma(_250, _258, _256);
        float _278 = _276 * _216;
        float _280 = fma(_264, _270, _262);
        float _282 = _280 * _216;
        float _284 = fma(_268, _274, _266);
        float _286 = _272 * _158;
        float _288 = _284 * _158;
        float2 _768 = float2(_286, _278);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_768, float2(0.0), isnan(_768)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_768, float2(0.0), isnan(_768)), level(_128)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float2 _783 = float2(_288, _278);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_783, float2(0.0), isnan(_783)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_783, float2(0.0), isnan(_783)), level(_128)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _798 = float2(_286, _282);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_798, float2(0.0), isnan(_798)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_798, float2(0.0), isnan(_798)), level(_128)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float2 _813 = float2(_288, _282);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_813, float2(0.0), isnan(_813)), level(_128)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_813, float2(0.0), isnan(_813)), level(_128)).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float _324 = -_304;
        float _326 = _296 + _324;
        float _328 = -_302;
        float _330 = _294 + _328;
        float _332 = fma(_236, _326, _304);
        float _334 = -_318;
        float _336 = _310 + _334;
        float _338 = fma(_236, _330, _302);
        float _340 = -_320;
        float _342 = _312 + _340;
        float _344 = -_306;
        float _346 = _298 + _344;
        float _348 = -_322;
        float _350 = _314 + _348;
        float _352 = fma(_236, _336, _318);
        float _354 = fma(_236, _342, _320);
        float _356 = fma(_236, _346, _306);
        float _358 = fma(_236, _350, _322);
        float _360 = -_352;
        float _362 = _360 + _338;
        float _364 = -_354;
        float _366 = _364 + _332;
        float _368 = 0.0 + _126;
        float _370 = precise::clamp(_368, 0.0, 1.0);
        float _372 = -_358;
        float _374 = _372 + _356;
        float _376 = fma(_240, _362, _352);
        float _378 = fma(_240, _366, _354);
        float _380 = fma(_88, _370, _86);
        float _382 = fma(_240, _374, _358);
        float _384 = -_376;
        float _386 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[13].x, _384);
        float _388 = -_378;
        float _390 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[13].y, _388);
        float _392 = 1.0 / _380;
        float _394 = -_382;
        float _396 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[13].z, _394);
        float _398 = fma(_118, _386, _376);
        float _400 = fma(_118, _390, _378);
        float _402 = fma(_118, _396, _382);
        float _404 = _370 * _398;
        float _406 = _370 * _400;
        float _408 = _370 * _402;
        float _410 = -_404;
        float _412 = _410 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _414 = -_406;
        float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _418 = -_408;
        float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _422 = fma(_86, _412, _404);
        float _424 = fma(_86, _416, _406);
        float _426 = fma(_86, _420, _408);
        float _428 = _422 * _392;
        float _430 = _424 * _392;
        float _432 = _426 * _392;
        out.m_36.x = _428;
        out.m_36.y = _430;
        out.m_36.z = _432;
        out.m_36.w = _380;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _86;
    return out;
}

