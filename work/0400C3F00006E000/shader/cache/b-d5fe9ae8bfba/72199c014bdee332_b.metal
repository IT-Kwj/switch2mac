#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
};

struct main0_out
{
    float4 m_48 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_62 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_46 [[attribute(6)]];
    float4 m_44 [[attribute(7)]];
    float4 m_50 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _79(thread const int& _5383, thread const int& _5384, constant _10& support_buffer)
{
    float _5387 = as_type<float>(support_buffer._m4);
    int _5389 = _5384 + as_type<int>(_5387);
    int _5391 = 1 + _5389;
    float _5393 = support_buffer._m5[_5391].x;
    float _5395 = abs(_5393);
    bool _5397 = _5395 == 1.0;
    if (_5397)
    {
        return _5383;
    }
    float _5399 = float(_5383);
    float _5401 = _5399 / _5395;
    int _5403 = int(_5401);
    return _5403;
}

static inline __attribute__((always_inline))
int _80(thread const int& _5433, thread const int& _5434, constant _10& support_buffer)
{
    float _5437 = as_type<float>(support_buffer._m4);
    int _5439 = _5434 + as_type<int>(_5437);
    int _5441 = 1 + _5439;
    float _5443 = support_buffer._m5[_5441].x;
    bool _5445 = _5443 == 1.0;
    if (_5445)
    {
        return _5433;
    }
    float _5447 = float(_5433);
    float _5449 = _5447 * _5443;
    int _5451 = int(_5449);
    return _5451;
}

static inline __attribute__((always_inline))
void _77(thread const int& _5078, thread const int& _5079, thread const int& _5080, thread const int& _5081, thread int& _5082, thread int& _5083, thread int& _5084, thread int& _5085, thread int& _5086, thread int& _5087, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _5090 = _5079;
    int _5092 = _5080;
    float _5094 = 0.0 + as_type<float>(_5078);
    bool _5096 = _5094 != 0.0;
    bool _5098 = isnan(_5094);
    bool _5100 = _5096 || _5098;
    bool _5102 = isnan(0.0);
    bool _5104 = _5100 || _5102;
    int _5106 = as_type<int>(_5094);
    int _5108 = _5104 ? (-1) : 0;
    if (!_5104)
    {
        float _5110 = as_type<float>(_5078) * 1.0;
        _5090 = as_type<int>(_5110);
    }
    int _5112 = _5090;
    bool _5114 = !_5104;
    int _5116 = _5112;
    int _5118 = _5112;
    if (!_5114)
    {
        bool _5120 = _5094 >= 0.0;
        bool _5122 = isnan(_5094);
        bool _5124 = _5120 || _5122;
        bool _5126 = isnan(0.0);
        bool _5128 = _5124 || _5126;
        _5108 = _5128 ? (-1) : 0;
        if (!_5128)
        {
            _5116 = 2147483647;
        }
        int _5130 = _5116;
        bool _5132 = !_5128;
        int _5134 = _5130;
        _5118 = _5130;
        if (!_5132)
        {
            float _5136 = abs(as_type<float>(_5078));
            float _5138 = 0.0 + _5136;
            bool _5140 = _5138 > as_type<float>(0x7f800000u /* inf */);
            bool _5142 = isnan(_5138);
            bool _5144 = _5140 || _5142;
            bool _5146 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5148 = _5144 || _5146;
            _5106 = as_type<int>(_5138);
            _5108 = _5148 ? (-1) : 0;
            if (_5148)
            {
                float _5150 = as_type<float>(_5078) + 1.0;
                _5134 = as_type<int>(_5150);
            }
            int _5152 = _5134;
            int _5154 = _5152;
            _5118 = _5152;
            if (!_5148)
            {
                bool _5156 = _5138 != as_type<float>(0x7f800000u /* inf */);
                bool _5158 = isnan(_5138);
                bool _5160 = _5156 || _5158;
                bool _5162 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5164 = _5160 || _5162;
                _5108 = _5164 ? (-1) : 0;
                if (!_5164)
                {
                    _5154 = _5078;
                }
                int _5166 = _5154;
                bool _5168 = !_5164;
                _5118 = _5166;
                if (!_5168)
                {
                    float _5170 = as_type<float>(_5078) * 18446744073709551616.0;
                    float _5172 = rsqrt(_5170);
                    float _5174 = _5170 * _5172;
                    float _5176 = _5172 * 0.5;
                    float _5178 = -_5174;
                    float _5180 = 0.0 + _5178;
                    float _5182 = fma(_5176, _5180, 0.5);
                    float _5184 = fma(_5174, _5182, _5174);
                    float _5186 = -_5184;
                    float _5188 = 0.0 + _5186;
                    float _5190 = fma(_5184, _5188, _5170);
                    float _5192 = fma(_5176, _5190, _5184);
                    float _5194 = _5192 * 2.3283064365386962890625e-10;
                    _5118 = as_type<int>(_5194);
                    _5106 = as_type<int>(_5180);
                    _5092 = as_type<int>(_5184);
                }
            }
        }
    }
    int _5196 = _5118;
    int _5198 = _5106;
    int _5200 = _5092;
    int _5202 = _5108;
    _5082 = _5196;
    _5083 = _5081;
    _5084 = 0;
    _5085 = _5198;
    _5086 = _5200;
    _5087 = _5202;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1908 = false;
    bool _1206 = false;
    bool _1014 = false;
    bool _412 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_37.w;
    float _86 = trunc(_84);
    int _88 = int(_86);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_40.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2084 = as_type<float>(_104);
        out.gl_Position.z = _2084;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_42.w;
    float _110 = float(_88);
    float _112 = -_108;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_108);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    bool _126 = _114 >= _110;
    bool _128 = !_124;
    bool _130 = _126 || _128;
    float _132 = _114;
    if (_130)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _96;
    if (_130)
    {
        out.m_40.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _106 = as_type<int>(_136);
    }
    int _138 = _106;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2148 = as_type<float>(_138);
        out.gl_Position.z = _2148;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_44.w;
    float _142 = 1.0 / _110;
    float _144 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_42.x;
    float _158 = in.m_42.y;
    float _160 = in.m_42.z;
    float _162 = in.m_37.x;
    float _164 = in.m_37.y;
    float _166 = in.m_37.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    float _262 = fma(_256, _140, _166);
    float _264 = _114 * _142;
    bool _266 = !_244;
    float _268 = _258;
    float _286;
    if (!_266)
    {
        float _270 = in.m_46.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        _286 = _264;
    }
    _288 = false;
    float _290 = _286;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _302 = 1.0 / _294;
    float _304 = _296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _290 + _306;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _312 = _298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _314 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _316 = isnan(_290);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _328 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_290);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_324;
    float _342 = _340 + 1.0;
    float _344 = _308 * _302;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _348;
    out.m_48.x = _304;
    out.m_48.y = _326;
    out.m_48.z = _312;
    out.m_48.w = _346;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = _338 * _342;
    float _362 = fma(_350, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = fma(_354, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_358, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = -_338;
    float _370 = _368 + 1.0;
    float _372 = _362 * _360;
    float _374 = _364 * _360;
    float _376 = _366 * _360;
    float _378 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _380 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[144].x, _378);
    float _386 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[144].y, _380);
    float _388 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[144].z, _382);
    bool _390 = !_300;
    bool _392 = _300;
    float _410;
    if (!_390)
    {
        float _394 = in.m_46.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        _410 = _264;
    }
    _412 = false;
    float _414 = _410;
    int _416 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _418 = _416;
    int _420 = 0;
    int _422 = _79(_418, _420, (*spvDescriptorSet0.support_buffer));
    float _424 = in.m_50.z;
    float _426 = 0.0 + _264;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = trunc(_424);
    int _432 = int(_430);
    int _434 = _422 + (-1);
    float _436 = float(_434);
    float _438 = _428 * _436;
    float _440 = trunc(_438);
    int _442 = int(_440);
    int _444 = _442;
    int _446 = 0;
    int _448 = _80(_444, _446, (*spvDescriptorSet0.support_buffer));
    int _450 = _432;
    int _452 = 0;
    int _454 = _80(_450, _452, (*spvDescriptorSet0.support_buffer));
    float4 _457 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_448, _454)), 0).xyzw;
    float _459 = _457.x;
    float _461 = _457.y;
    float _463 = _457.z;
    float _465 = _457.w;
    float _467 = in.m_44.x;
    float _469 = in.m_44.y;
    float _471 = in.m_44.z;
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _475 = in.m_50.x;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _479 = _477 != 0;
    float _481 = in.m_46.z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _489 = _487 != 0;
    float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _493 = in.m_46.x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _499 = _497 != 0;
    float _501 = in.m_46.w;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _505 = _503 != 0;
    float _507 = 1.0 / _485;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _511 = _509 != 0;
    float _513 = _384 * _467;
    float _515 = _386 * _469;
    float _517 = in.m_46.y;
    float _519 = _388 * _471;
    float _521 = -_475;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _531 = _529 != 0;
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _535 = _493 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_479)
    {
        bool _537 = _481 > 0.5;
        _392 = _537;
    }
    bool _539 = _392;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _543 = 0.0;
    if (!_479)
    {
        _543 = _475;
    }
    float _545 = _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _551 = _545;
    if (_479)
    {
        float _553 = _539 ? _523 : _475;
        _551 = _553;
    }
    float _555 = _551;
    float _557 = 1.0 / _527;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _561 = _559 != 0;
    float _563 = -_495;
    float _565 = fma(_535, 2.0, _563);
    bool _567 = _501 > 0.5;
    bool _569 = _567 && _511;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _571;
    bool _575 = _493 > 0.5;
    bool _577 = _575 && _499;
    float _579 = 1.0 / _549;
    float _581 = in.m_50.y;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _587 = _517 > 0.5;
    float _589 = _533 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _591 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _593 = isnan(_414);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _605 = _517 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _609 = _517 > 0.5;
    bool _611 = _609 && _505;
    float _613 = fma(_605, -2.0, _541);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _615;
    float _619 = _573 * _507;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _623 = _414 + _621;
    float _625 = _585 * _579;
    float _627 = _617 * _557;
    float _629 = _617;
    float _631 = _619;
    if (!_489)
    {
        _629 = _475;
    }
    float _633 = _629;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _637 = _414 + _635;
    float _639 = _577 ? _523 : _475;
    float _641 = fma(_627, _623, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _645 = _414 + _643;
    float _647 = _633;
    float _649 = _645;
    if (_489)
    {
        float _651 = _587 ? _523 : _475;
        _647 = _651;
    }
    float _653 = _647;
    float _655 = _603 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _657 = -_581;
    float _659 = _657 + 1.0;
    float _661 = fma(_625, _645, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _663 = fma(_619, _637, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _665 = fma(_655, _639, -0.5);
    float _667 = _473 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _669 = _491 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _671 = _569 ? _659 : _581;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _675 = fma(_667, _555, -0.5);
    float _677 = _673;
    if (!_531)
    {
        _649 = _517;
    }
    float _679 = _649;
    float _681 = fma(_669, _671, -0.5);
    float _683 = _679;
    if (_531)
    {
        _683 = _493;
    }
    float _685 = _683;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _689 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _691 = isnan(_414);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _613);
    bool _703 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _705 = isnan(_414);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[78].z, _687);
    float _717 = _687;
    if (!_531)
    {
        _717 = _493;
    }
    float _719 = _717;
    float _721 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].z, _673);
    float _723 = _719;
    if (_531)
    {
        _723 = _481;
    }
    float _725 = _723;
    float _727 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _715);
    if (!_531)
    {
        _677 = _517;
    }
    float _729 = _677;
    float _731 = -_699;
    float _733 = _731 + 1.0;
    float _735 = _729;
    if (_531)
    {
        _735 = _493;
    }
    float _737 = _735;
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[84].z, _607);
    bool _741 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _743 = isnan(_414);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _755 = -_114;
    float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[76].x, _565);
    float _759 = -_601;
    float _761 = _759 + 1.0;
    float _763 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[84].x, _739);
    float _765 = _713 * _733;
    float _767 = fma(_727, _665, _757);
    float _769 = _751 * _761;
    float _771 = -_751;
    float _773 = _771 + 1.0;
    float _775 = _737 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _777 = -_713;
    float _779 = _777 + 1.0;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _783 = _641 * _769;
    float _785 = _763 * (-0.15915493667125701904296875);
    float _787 = -_781;
    float _789 = fma(_775, 2.0, _787);
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_531)
    {
        _631 = _481;
    }
    float _793 = _631;
    float _795 = _601 * _779;
    float _797 = _785 * 6.283185482025146484375;
    float _799 = sin(_797);
    float _801 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[131].x, _783);
    float _803 = _753 * _581;
    bool _805 = _481 > 0.5;
    bool _807 = _805 && _561;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _811 = _793;
    float _813 = _803;
    if (!_531)
    {
        _791 = _793;
    }
    float _815 = _791;
    float _817 = fma(_661, _795, _801);
    float _819 = _785 * 6.283185482025146484375;
    float _821 = cos(_819);
    float _823 = _815;
    if (_531)
    {
        _811 = _517;
    }
    float _825 = _811;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_611)
    {
        float _829 = -_803;
        float _831 = _829 + 1.0;
        _813 = _831;
    }
    float _833 = _813;
    float _835 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[78].w, _809);
    if (_531)
    {
        _823 = _517;
    }
    float _837 = _823;
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[83].w, _827);
    float _841 = fma(_589, _833, -0.5);
    float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _845 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _835);
    float _847 = fma(_663, _765, _817);
    float _849 = _799 * _681;
    int _851 = _807 ? as_type<int>(_659) : as_type<int>(_581);
    float _853 = -_701;
    float _855 = fma(_845, _841, _853);
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _861 = _821 * _681;
    float _863 = _837 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _865 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[134].x, _847);
    float _867 = _653 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _869 = fma(_799, _675, _861);
    float _871 = as_type<float>(_851) * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _873 = fma(_863, -2.0, _857);
    float _875 = _865 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _877 = _871 * _843;
    float _879 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _839);
    float _881 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _873);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _885 = _867 * _859;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _889 = -_881;
    float _891 = fma(_879, _869, _889);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _895 = _442 + 1;
    float _897 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _885;
    out.m_52.y = _877;
    float _903 = -_849;
    float _905 = fma(_821, _675, _903);
    float _907 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _721);
    float _909 = -_114;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[81].x, _789);
    out.m_54.x = _897;
    out.m_54.y = _899;
    out.m_54.z = _901;
    out.m_54.w = _875;
    int _913 = min(_434, _895);
    float _915 = fma(_907, _905, _911);
    float _917 = _891 + 0.5;
    float _919 = _855 + 0.5;
    uint _922 = as_type<uint>(half2(float2(_465, 0.0)));
    uint _924 = extract_bits(_922, 0u, 8u);
    int _926 = int(_924) & 255;
    uint _928 = extract_bits(_922, 8u, 8u);
    int _930 = int(_928) & 255;
    int _932 = _930 << 8;
    int _934 = _926 | _932;
    bool _936 = _934 >= 32768;
    int _938 = _934 + (-1024);
    int _940 = _938;
    int _942 = _851;
    int _944 = as_type<int>(_881);
    if (_936)
    {
        int _946 = ~_934;
        int _948 = _946 + 33792;
        int _950 = _948 + 1;
        _940 = _950;
    }
    int _952 = _940;
    int _954 = _952 + 30719;
    float _956 = float(_954);
    float _958 = fma(_956, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _960 = abs(_958);
    float _962 = -_960;
    float _964 = _962 + 1.0;
    float _966 = abs(_958);
    float _968 = fma(_966, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _970 = _958 < 0.0;
    float _972 = float(_970);
    int _974 = as_type<int>(_964) + (-218103808);
    bool _976 = uint(_974) >= 1920991232u;
    float _978 = _767 + 0.5;
    float _980 = abs(_958);
    float _982 = fma(_980, _968, -0.212114393711090087890625);
    float _984 = _915 + 0.5;
    float _986 = abs(_958);
    float _988 = fma(_986, _982, 1.570728778839111328125);
    bool _990 = !_976;
    float _1012;
    if (!_990)
    {
        int _992 = as_type<int>(_964);
        int _994 = _851;
        int _996 = as_type<int>(_881);
        int _998 = 5248;
        int _1000;
        int _1002;
        int _1004;
        int _1006;
        int _1008;
        int _1010;
        _77(_992, _994, _996, _998, _1000, _1002, _1004, _1006, _1008, _1010, out.gl_Position, out.gl_PointSize);
        _1012 = as_type<float>(_1000);
        _942 = _1002;
        _944 = _1008;
        _1014 = true;
    }
    else
    {
        float _1016 = rsqrt(_964);
        float _1018 = _964 * _1016;
        float _1020 = _1016 * 0.5;
        float _1022 = -_1018;
        float _1024 = 0.0 + _1022;
        float _1026 = fma(_1020, _1024, 0.5);
        float _1028 = fma(_1018, _1026, _1018);
        float _1030 = -_1028;
        float _1032 = 0.0 + _1030;
        float _1034 = fma(_1028, _1032, _964);
        float _1036 = fma(_1020, _1034, _1028);
        _1012 = _1036;
    }
    _1014 = false;
    float _1038 = _1012;
    int _1040 = _942;
    int _1042 = _944;
    int _1044 = _913;
    int _1046 = 0;
    int _1048 = _80(_1044, _1046, (*spvDescriptorSet0.support_buffer));
    int _1050 = _432;
    int _1052 = 0;
    int _1054 = _80(_1050, _1052, (*spvDescriptorSet0.support_buffer));
    float4 _1056 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1048, _1054)), 0).xyzw;
    float _1058 = _1056.x;
    float _1060 = _1056.y;
    float _1062 = _1056.z;
    float _1064 = _1056.w;
    float _1066 = floor(_438);
    float _1068 = _988 * _1038;
    float _1070 = _972 * 2.0;
    float _1072 = _956 * 3.883221149444580078125;
    float _1074 = -_1070;
    float _1076 = fma(_1068, _1074, _1068);
    float _1078 = _1072 * 0.15915493667125701904296875;
    float _1080 = fma(_972, 3.1415927410125732421875, _1076);
    float _1082 = _1078 * 6.283185482025146484375;
    float _1084 = cos(_1082);
    float _1086 = _1080 * 0.15915493667125701904296875;
    float _1088 = -_1066;
    float _1090 = _438 + _1088;
    float _1092 = _1086 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = _1078 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = _1094 * _1084;
    float _1102 = _1094 * _1098;
    uint _1104 = as_type<uint>(half2(float2(_1064, 0.0)));
    float _1106 = -_463;
    float _1108 = _1106 + _1062;
    uint _1110 = extract_bits(_1104, 0u, 8u);
    int _1112 = int(_1110) & 255;
    uint _1114 = extract_bits(_1104, 8u, 8u);
    int _1116 = int(_1114) & 255;
    int _1118 = _1116 << 8;
    int _1120 = _1112 | _1118;
    float _1122 = fma(_1090, _1108, _463);
    bool _1124 = _1120 >= 32768;
    int _1126 = _1120 + (-1024);
    int _1128 = _1126;
    if (_1124)
    {
        int _1130 = ~_1120;
        int _1132 = _1130 + 33792;
        int _1134 = _1132 + 1;
        _1128 = _1134;
    }
    int _1136 = _1128;
    int _1138 = _1136 + 30719;
    float _1140 = float(_1138);
    float _1142 = fma(_1140, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1144 = abs(_1142);
    float _1146 = -_1144;
    float _1148 = _1146 + 1.0;
    float _1150 = abs(_1142);
    float _1152 = fma(_1150, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1154 = as_type<int>(_1148) + (-218103808);
    float _1156 = abs(_1142);
    float _1158 = fma(_1156, _1152, -0.212114393711090087890625);
    bool _1160 = _1142 < 0.0;
    float _1162 = float(_1160);
    bool _1164 = uint(_1154) >= 1920991232u;
    float _1166 = -_459;
    float _1168 = _1166 + _1058;
    float _1170 = -_461;
    float _1172 = _1170 + _1060;
    float _1174 = abs(_1142);
    float _1176 = fma(_1174, _1158, 1.570728778839111328125);
    float _1178 = fma(_1090, _1168, _459);
    float _1180 = fma(_1090, _1172, _461);
    bool _1182 = !_1164;
    float _1204;
    if (!_1182)
    {
        int _1184 = as_type<int>(_1148);
        int _1186 = _1040;
        int _1188 = _1042;
        int _1190 = 6128;
        int _1192;
        int _1194;
        int _1196;
        int _1198;
        int _1200;
        int _1202;
        _77(_1184, _1186, _1188, _1190, _1192, _1194, _1196, _1198, _1200, _1202, out.gl_Position, out.gl_PointSize);
        _1204 = as_type<float>(_1192);
        _1206 = true;
    }
    else
    {
        float _1208 = rsqrt(_1148);
        float _1210 = _1148 * _1208;
        float _1212 = _1208 * 0.5;
        float _1214 = -_1210;
        float _1216 = 0.0 + _1214;
        float _1218 = fma(_1212, _1216, 0.5);
        float _1220 = fma(_1210, _1218, _1210);
        float _1222 = -_1220;
        float _1224 = 0.0 + _1222;
        float _1226 = fma(_1220, _1224, _1148);
        float _1228 = fma(_1212, _1226, _1220);
        _1204 = _1228;
    }
    _1206 = false;
    float _1230 = _1204;
    float _1232 = in.m_46.x;
    float _1234 = in.m_46.y;
    float _1236 = in.m_46.z;
    float _1238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1240 = log2(_1238);
    float _1242 = _1176 * _1230;
    float _1244 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1246 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1250 = _1248 != 0;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1258 = _1256 != 0;
    float _1260 = _1140 * 3.883221149444580078125;
    float _1262 = -_958;
    float _1264 = _1262 + _1142;
    bool _1266 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1268 = isnan(1.0);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1274 = _1270 || _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1278 = 1.0 + _1276;
    float _1280 = fma(_1090, _1264, _958);
    float _1282 = _1240 * _114;
    float _1284 = 1.0 / _1278;
    float _1286 = _1236 * 2.0;
    float _1288 = _1232 * 2.0;
    float _1290 = _1234 + _1236;
    float _1292 = exp2(_1282);
    float _1294 = _1234 * 2.0;
    float _1296 = _1290 + (-1.0);
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1300 = floor(_1286);
    float _1302 = _1234 + _1232;
    float _1304 = _1302 + (-1.0);
    float _1306 = floor(_1288);
    float _1308 = -_1292;
    float _1310 = _1308 + 1.0;
    bool _1312 = _1300 > 0.0;
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1316 = _1300 >= 0.0;
    bool _1318 = isnan(_1300);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    float _1326 = floor(_1294);
    float _1328 = in.m_56.x;
    float _1330 = in.m_56.y;
    float _1332 = in.m_56.z;
    bool _1334 = !_1250;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = _1324 ? 0 : 1;
    bool _1340 = _1306 > 0.0;
    bool _1342 = _1306 >= 0.0;
    bool _1344 = isnan(_1306);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    int _1352 = ~_1338;
    int _1354 = _1352 + 1;
    int _1356 = _1354 + 1;
    int _1358 = abs(_1336);
    int _1360 = _1356;
    float _1362 = _1280;
    if (!_1312)
    {
        int _1364 = ~_1338;
        int _1366 = _1364 + 1;
        _1360 = _1366;
    }
    int _1368 = _1360;
    bool _1370 = !_1254;
    int _1372 = _1370 ? 0 : 1;
    int _1374 = _1350 ? 0 : 1;
    float _1376 = float(_1358);
    float _1378 = float(_1368);
    int _1380 = abs(_1372);
    int _1382 = ~_1374;
    int _1384 = _1382 + 1;
    int _1386 = _1384 + 1;
    float _1388 = _1376 * _1378;
    bool _1390 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1392 = isnan(0.0);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1398 = _1394 || _1396;
    int _1400 = _1386;
    if (!_1340)
    {
        int _1402 = ~_1374;
        int _1404 = _1402 + 1;
        _1400 = _1404;
    }
    int _1406 = _1400;
    float _1408 = _1388 * (-2.0);
    float _1410 = _1398 ? _1310 : 0.0;
    float _1412 = float(_1380);
    float _1414 = float(_1406);
    if (_1274)
    {
        float _1416 = _1410 * _1284;
        _132 = _1416;
    }
    float _1418 = _132;
    bool _1420 = _1326 > 0.0;
    float _1422 = _1232 + (-0.5);
    bool _1424 = _1326 >= 0.0;
    bool _1426 = isnan(_1326);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(0.0);
    bool _1432 = _1428 || _1430;
    float _1434 = _1412 * _1414;
    float _1436 = fma(_1408, _1328, _1328);
    float _1438 = fma(_1314, _1408, _1314);
    int _1440 = _1432 ? 0 : 1;
    float _1442 = _1434 * (-2.0);
    float _1444 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1436);
    bool _1446 = !_1258;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = _1232 + _1236;
    int _1452 = ~_1440;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    float _1458 = fma(_1438, _1418, _1444);
    int _1460 = abs(_1448);
    float _1462 = fma(_1298, _1442, _1298);
    int _1464 = _1456;
    if (!_1420)
    {
        int _1466 = ~_1440;
        int _1468 = _1466 + 1;
        _1464 = _1468;
    }
    int _1470 = _1464;
    float _1472 = fma(_1442, _1330, _1330);
    float _1474 = _1234 + (-0.5);
    float _1476 = _1458 * 0.15915493667125701904296875;
    float _1478 = float(_1460);
    float _1480 = _1450 + (-1.0);
    float _1482 = float(_1470);
    float _1484 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1472);
    float _1486 = _1236 + (-0.5);
    float _1488 = _1476 * 6.283185482025146484375;
    float _1490 = sin(_1488);
    bool _1492 = _1180 != 0.0;
    bool _1494 = isnan(_1180);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan(0.0);
    bool _1500 = _1496 || _1498;
    float _1502 = _1478 * _1482;
    float _1504 = fma(_1462, _1418, _1484);
    float _1506 = _1502 * (-2.0);
    float _1508 = _1504 * 0.15915493667125701904296875;
    float _1510 = _1476 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1516 = fma(_1506, _1332, _1332);
    float _1518 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1178);
    float _1520 = _1162 * 2.0;
    float _1522 = fma(_1514, _1506, _1514);
    float _1524 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1516);
    float _1526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1122);
    float _1528 = _1508 * 6.283185482025146484375;
    float _1530 = sin(_1528);
    float _1532 = -_1520;
    float _1534 = fma(_1242, _1532, _1242);
    float _1536 = fma(_1522, _1418, _1524);
    float _1538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1180);
    float _1540 = _1246 * _1526;
    float _1542 = fma(_1162, 3.1415927410125732421875, _1534);
    float _1544 = _1536 * 0.15915493667125701904296875;
    float _1546 = _753 * _1538;
    float _1548 = _1508 * 6.283185482025146484375;
    float _1550 = cos(_1548);
    bool _1552 = _1178 == 0.0;
    bool _1554 = !_1500;
    bool _1556 = _1552 && _1554;
    bool _1558 = _1122 == 0.0;
    bool _1560 = _1558 && _1556;
    float _1562 = _1544 * 6.283185482025146484375;
    float _1564 = cos(_1562);
    float _1566 = _1244 * _1518;
    float _1568 = _1490 * _1530;
    float _1570 = _1512 * _1530;
    float _1572 = _1544 * 6.283185482025146484375;
    float _1574 = sin(_1572);
    float _1576 = _1512 * _1550;
    float _1578 = _1490 * _1550;
    if (!_1560)
    {
        float _1580 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1280);
        _1362 = _1580;
    }
    float _1582 = _1362;
    float _1584 = _1512 * _1564;
    float _1586 = _1490 * _1564;
    float _1588 = _1550 * _1564;
    float _1590 = _1530 * _1564;
    float _1592 = _1584 * _1546;
    float _1594 = _1586 * _1546;
    float _1596 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1598 = fma(_1574, _1576, _1568);
    float _1600 = fma(_1574, _1568, _1576);
    float _1602 = -_1570;
    float _1604 = fma(_1574, _1578, _1602);
    float _1606 = -_1546;
    float _1608 = _1574 * _1606;
    float _1610 = -_1578;
    float _1612 = fma(_1574, _1570, _1610);
    float _1614 = fma(_1598, _1566, _1592);
    float _1616 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1618 = fma(_1588, _1566, _1608);
    float _1620 = fma(_1604, _1566, _1594);
    float _1622 = fma(_1612, _1540, _1614);
    float _1624 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1616);
    float _1626 = fma(_1590, _1540, _1618);
    float _1628 = fma(_1600, _1540, _1620);
    float _1630 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1596);
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1634 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1636 = _1260 * 0.15915493667125701904296875;
    float _1638 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1624);
    float _1640 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1630);
    float _1642 = fma(_1626, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1632);
    float _1644 = fma(_1626, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1634);
    float _1646 = _1638 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1648 = _1640 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1650 = fma(_1628, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1642);
    float _1652 = fma(_1628, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1644);
    float _1654 = _1636 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1660 = _1646 + _1650;
    float _1662 = _1648 + _1652;
    float _1664 = _1542 * 0.15915493667125701904296875;
    float _1666 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1658);
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1670 = _1660 + _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1674 = _1662 + _1672;
    float _1676 = _1636 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1682 = _1670 * _1670;
    float _1684 = _1674 * _1674;
    float _1686 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1666);
    float _1688 = fma(_1626, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1680);
    float _1690 = -_1582;
    float _1692 = _1574 * _1690;
    float _1694 = _1682 + _1684;
    float _1696 = _1664 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    float _1700 = fma(_1628, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1688);
    float _1702 = _1686 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1704 = _1584 * _1582;
    float _1706 = _1702 + _1700;
    float _1708 = sqrt(_1694);
    float _1710 = -_1100;
    float _1712 = fma(_1698, _1656, _1710);
    float _1714 = -_1102;
    float _1716 = fma(_1698, _1678, _1714);
    float _1718 = fma(_1090, _1712, _1100);
    float _1720 = fma(_1090, _1716, _1102);
    bool _1722 = _1708 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1718;
    float _1726 = _1720;
    float _1728 = _1586;
    float _1730 = _1702;
    float _1732 = _1574;
    float _1734 = _1582;
    if (!_1560)
    {
        float _1736 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1718);
        _1724 = _1736;
    }
    float _1738 = _1724;
    float _1740 = _1586 * _1582;
    if (!_1560)
    {
        float _1742 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1720);
        _1726 = _1742;
    }
    float _1744 = _1726;
    if (!_1722)
    {
        _1728 = _1684;
    }
    float _1746 = _1728;
    float _1748 = _1746;
    if (!_1722)
    {
        _1730 = _1682;
    }
    float _1750 = _1730;
    float _1752 = _1750;
    if (!_1722)
    {
        _1732 = _1660;
    }
    float _1754 = _1732;
    float _1756 = _1754;
    if (!_1722)
    {
        _1734 = _1662;
    }
    float _1758 = _1734;
    float _1760 = _1758;
    if (!_1722)
    {
        _268 = _1706;
    }
    float _1762 = _268;
    bool _1764 = !_1722;
    float _1766 = _1762;
    if (!_1764)
    {
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1772 = _1708 + _1770;
        float _1774 = rsqrt(_1694);
        float _1776 = _1772 * _1768;
        float _1778 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1780 = _1776 * 0.15915493667125701904296875;
        float _1782 = _1780 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = _1780 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = fma(_1784, _1778, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1792 = _1774 * _1790;
        float _1794 = _1788 + (-1.0);
        float _1796 = _1670 * _1792;
        float _1798 = _1674 * _1792;
        float _1800 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1802 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1804 = _1798 * _1798;
        float _1806 = fma(_1706, _1788, _1800);
        float _1808 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1810 = _1796 * _1796;
        _1766 = _1806;
        _1752 = _1810;
        _1748 = _1804;
        _1756 = _1808;
        _1760 = _1802;
    }
    float _1812 = _1766;
    float _1814 = _1752;
    float _1816 = _1748;
    float _1818 = _1756;
    float _1820 = _1760;
    float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1824 = _1812 + _1822;
    float _1826 = fma(_1598, _1738, _1704);
    float _1828 = fma(_1588, _1738, _1692);
    float _1830 = fma(_1604, _1738, _1740);
    float _1832 = fma(_1824, _1824, _1814);
    float _1834 = fma(_1612, _1744, _1826);
    float _1836 = fma(_1590, _1744, _1828);
    float _1838 = fma(_1600, _1744, _1830);
    float _1840 = _1832 + _1816;
    float _1842 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1846 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_58.x = _978;
    out.m_58.y = _919;
    out.m_58.z = _984;
    out.m_58.w = _917;
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1842);
    float _1850 = sqrt(_1840);
    float _1852 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1844);
    float _1854 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1846);
    float _1856 = fma(_1838, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1848);
    float _1858 = fma(_1838, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1852);
    float _1860 = fma(_1838, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1854);
    out.m_60.x = _1856;
    out.m_60.y = _1858;
    out.m_60.z = _1860;
    bool _1862 = _1850 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1864 = isnan(_1850);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1870 = _1866 || _1868;
    float _1872 = _1848;
    if (!_1870)
    {
        _1872 = 1.0;
    }
    float _1874 = _1872;
    bool _1876 = !_1870;
    float _1878 = _1874;
    if (!_1876)
    {
        bool _1880 = _1850 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1882 = isnan(_1850);
        bool _1884 = _1880 || _1882;
        bool _1886 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1888 = _1884 || _1886;
        if (!_1888)
        {
            float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1892 = _1850 + _1890;
            float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1896 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1894;
            float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1900 = _1898 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1902 = 1.0 / _1896;
            float _1904 = _1892 * _1902;
            float _1906 = fma(_1904, _1900, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1878 = _1906;
            _1908 = true;
        }
        else
        {
            bool _1910 = _1850 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1912 = isnan(_1850);
            bool _1914 = _1910 || _1912;
            bool _1916 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1918 = _1914 || _1916;
            if (!_1918)
            {
                float _1920 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1922 = _1850 + _1920;
                float _1924 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1926 = _1924 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1928 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1930 = _1928 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1932 = 1.0 / _1926;
                float _1934 = _1922 * _1932;
                float _1936 = fma(_1934, _1930, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1878 = _1936;
                _1908 = true;
            }
            else
            {
                _1878 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1908 = false;
    float _1938 = _1878;
    float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1942 = _1812 + _1940;
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1946 = _1818 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1950 = _1820 + _1948;
    float _1952 = fma(_1942, _1938, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1954 = fma(_1946, _1938, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1956 = fma(_1950, _1938, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1958 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1962 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1966 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1958);
    float _1968 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1960);
    float _1970 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1962);
    float _1972 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1964);
    float _1974 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1966);
    float _1976 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1968);
    float _1978 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1970);
    float _1980 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1972);
    float _1982 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1988 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1990 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1992 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1994 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1996 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1998 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1990);
    float _2000 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1992);
    float _2002 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1994);
    float _2004 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1996);
    float _2006 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1998);
    float _2008 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2000);
    float _2010 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2002);
    float _2012 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2004);
    float _2014 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2006);
    float _2016 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2008);
    float _2018 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2010);
    float _2020 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2012);
    float _2022 = _2014 + _2016;
    float _2024 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2026 = _2022 * 0.5;
    out.m_62.x = _1954;
    out.m_62.y = _1952;
    out.m_62.z = _1956;
    out.m_40.x = _2024;
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _2014;
    out.gl_Position.w = _2016;
    out.m_64.z = _2026;
    out.m_64.w = _2016;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1908 = false;
    bool _1206 = false;
    bool _1014 = false;
    bool _412 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_37.w;
    float _86 = trunc(_84);
    int _88 = int(_86);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_40.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2084 = as_type<float>(_104);
        out.gl_Position.z = _2084;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_42.w;
    float _110 = float(_88);
    float _112 = -_108;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_108);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    bool _126 = _114 >= _110;
    bool _128 = !_124;
    bool _130 = _126 || _128;
    float _132 = _114;
    if (_130)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _96;
    if (_130)
    {
        out.m_40.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _106 = as_type<int>(_136);
    }
    int _138 = _106;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2148 = as_type<float>(_138);
        out.gl_Position.z = _2148;
    }
    if (_130)
    {
        return out;
    }
    float _140 = in.m_44.w;
    float _142 = 1.0 / _110;
    float _144 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_42.x;
    float _158 = in.m_42.y;
    float _160 = in.m_42.z;
    float _162 = in.m_37.x;
    float _164 = in.m_37.y;
    float _166 = in.m_37.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    float _262 = fma(_256, _140, _166);
    float _264 = _114 * _142;
    bool _266 = !_244;
    float _268 = _258;
    float _286;
    if (!_266)
    {
        float _270 = in.m_46.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        _286 = _264;
    }
    _288 = false;
    float _290 = _286;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _302 = 1.0 / _294;
    float _304 = _296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _290 + _306;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _312 = _298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _314 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _316 = isnan(_290);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _328 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_290);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_324;
    float _342 = _340 + 1.0;
    float _344 = _308 * _302;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _348;
    out.m_48.x = _304;
    out.m_48.y = _326;
    out.m_48.z = _312;
    out.m_48.w = _346;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = _338 * _342;
    float _362 = fma(_350, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = fma(_354, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_358, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = -_338;
    float _370 = _368 + 1.0;
    float _372 = _362 * _360;
    float _374 = _364 * _360;
    float _376 = _366 * _360;
    float _378 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _380 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[144].x, _378);
    float _386 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[144].y, _380);
    float _388 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[144].z, _382);
    bool _390 = !_300;
    bool _392 = _300;
    float _410;
    if (!_390)
    {
        float _394 = in.m_46.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        _410 = _264;
    }
    _412 = false;
    float _414 = _410;
    int _416 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _418 = _416;
    int _420 = 0;
    int _422 = _79(_418, _420, (*spvDescriptorSet0.support_buffer));
    float _424 = in.m_50.z;
    float _426 = 0.0 + _264;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = trunc(_424);
    int _432 = int(_430);
    int _434 = _422 + (-1);
    float _436 = float(_434);
    float _438 = _428 * _436;
    float _440 = trunc(_438);
    int _442 = int(_440);
    int _444 = _442;
    int _446 = 0;
    int _448 = _80(_444, _446, (*spvDescriptorSet0.support_buffer));
    int _450 = _432;
    int _452 = 0;
    int _454 = _80(_450, _452, (*spvDescriptorSet0.support_buffer));
    float4 _457 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_448, _454)), 0).xyzw;
    float _459 = _457.x;
    float _461 = _457.y;
    float _463 = _457.z;
    float _465 = _457.w;
    float _467 = in.m_44.x;
    float _469 = in.m_44.y;
    float _471 = in.m_44.z;
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _475 = in.m_50.x;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _479 = _477 != 0;
    float _481 = in.m_46.z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _489 = _487 != 0;
    float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _493 = in.m_46.x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _499 = _497 != 0;
    float _501 = in.m_46.w;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _505 = _503 != 0;
    float _507 = 1.0 / _485;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _511 = _509 != 0;
    float _513 = _384 * _467;
    float _515 = _386 * _469;
    float _517 = in.m_46.y;
    float _519 = _388 * _471;
    float _521 = -_475;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _531 = _529 != 0;
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _535 = _493 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_479)
    {
        bool _537 = _481 > 0.5;
        _392 = _537;
    }
    bool _539 = _392;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _543 = 0.0;
    if (!_479)
    {
        _543 = _475;
    }
    float _545 = _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _551 = _545;
    if (_479)
    {
        float _553 = _539 ? _523 : _475;
        _551 = _553;
    }
    float _555 = _551;
    float _557 = 1.0 / _527;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _561 = _559 != 0;
    float _563 = -_495;
    float _565 = fma(_535, 2.0, _563);
    bool _567 = _501 > 0.5;
    bool _569 = _567 && _511;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _571;
    bool _575 = _493 > 0.5;
    bool _577 = _575 && _499;
    float _579 = 1.0 / _549;
    float _581 = in.m_50.y;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _587 = _517 > 0.5;
    float _589 = _533 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _591 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _593 = isnan(_414);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _605 = _517 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _609 = _517 > 0.5;
    bool _611 = _609 && _505;
    float _613 = fma(_605, -2.0, _541);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _615;
    float _619 = _573 * _507;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _623 = _414 + _621;
    float _625 = _585 * _579;
    float _627 = _617 * _557;
    float _629 = _617;
    float _631 = _619;
    if (!_489)
    {
        _629 = _475;
    }
    float _633 = _629;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _637 = _414 + _635;
    float _639 = _577 ? _523 : _475;
    float _641 = fma(_627, _623, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _645 = _414 + _643;
    float _647 = _633;
    float _649 = _645;
    if (_489)
    {
        float _651 = _587 ? _523 : _475;
        _647 = _651;
    }
    float _653 = _647;
    float _655 = _603 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _657 = -_581;
    float _659 = _657 + 1.0;
    float _661 = fma(_625, _645, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _663 = fma(_619, _637, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _665 = fma(_655, _639, -0.5);
    float _667 = _473 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _669 = _491 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _671 = _569 ? _659 : _581;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _675 = fma(_667, _555, -0.5);
    float _677 = _673;
    if (!_531)
    {
        _649 = _517;
    }
    float _679 = _649;
    float _681 = fma(_669, _671, -0.5);
    float _683 = _679;
    if (_531)
    {
        _683 = _493;
    }
    float _685 = _683;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _689 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _691 = isnan(_414);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _613);
    bool _703 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _705 = isnan(_414);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[78].z, _687);
    float _717 = _687;
    if (!_531)
    {
        _717 = _493;
    }
    float _719 = _717;
    float _721 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].z, _673);
    float _723 = _719;
    if (_531)
    {
        _723 = _481;
    }
    float _725 = _723;
    float _727 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _715);
    if (!_531)
    {
        _677 = _517;
    }
    float _729 = _677;
    float _731 = -_699;
    float _733 = _731 + 1.0;
    float _735 = _729;
    if (_531)
    {
        _735 = _493;
    }
    float _737 = _735;
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[84].z, _607);
    bool _741 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _743 = isnan(_414);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _755 = -_114;
    float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[76].x, _565);
    float _759 = -_601;
    float _761 = _759 + 1.0;
    float _763 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[84].x, _739);
    float _765 = _713 * _733;
    float _767 = fma(_727, _665, _757);
    float _769 = _751 * _761;
    float _771 = -_751;
    float _773 = _771 + 1.0;
    float _775 = _737 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _777 = -_713;
    float _779 = _777 + 1.0;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _783 = _641 * _769;
    float _785 = _763 * (-0.15915493667125701904296875);
    float _787 = -_781;
    float _789 = fma(_775, 2.0, _787);
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_531)
    {
        _631 = _481;
    }
    float _793 = _631;
    float _795 = _601 * _779;
    float _797 = _785 * 6.283185482025146484375;
    float _799 = sin(_797);
    float _801 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[131].x, _783);
    float _803 = _753 * _581;
    bool _805 = _481 > 0.5;
    bool _807 = _805 && _561;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _811 = _793;
    float _813 = _803;
    if (!_531)
    {
        _791 = _793;
    }
    float _815 = _791;
    float _817 = fma(_661, _795, _801);
    float _819 = _785 * 6.283185482025146484375;
    float _821 = cos(_819);
    float _823 = _815;
    if (_531)
    {
        _811 = _517;
    }
    float _825 = _811;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_611)
    {
        float _829 = -_803;
        float _831 = _829 + 1.0;
        _813 = _831;
    }
    float _833 = _813;
    float _835 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[78].w, _809);
    if (_531)
    {
        _823 = _517;
    }
    float _837 = _823;
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[83].w, _827);
    float _841 = fma(_589, _833, -0.5);
    float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _845 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _835);
    float _847 = fma(_663, _765, _817);
    float _849 = _799 * _681;
    int _851 = _807 ? as_type<int>(_659) : as_type<int>(_581);
    float _853 = -_701;
    float _855 = fma(_845, _841, _853);
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _861 = _821 * _681;
    float _863 = _837 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _865 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[134].x, _847);
    float _867 = _653 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _869 = fma(_799, _675, _861);
    float _871 = as_type<float>(_851) * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _873 = fma(_863, -2.0, _857);
    float _875 = _865 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _877 = _871 * _843;
    float _879 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _839);
    float _881 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _873);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _885 = _867 * _859;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _889 = -_881;
    float _891 = fma(_879, _869, _889);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _895 = _442 + 1;
    float _897 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _885;
    out.m_52.y = _877;
    float _903 = -_849;
    float _905 = fma(_821, _675, _903);
    float _907 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _721);
    float _909 = -_114;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[81].x, _789);
    out.m_54.x = _897;
    out.m_54.y = _899;
    out.m_54.z = _901;
    out.m_54.w = _875;
    int _913 = min(_434, _895);
    float _915 = fma(_907, _905, _911);
    float _917 = _891 + 0.5;
    float _919 = _855 + 0.5;
    uint _922 = as_type<uint>(half2(float2(_465, 0.0)));
    uint _924 = extract_bits(_922, 0u, 8u);
    int _926 = int(_924) & 255;
    uint _928 = extract_bits(_922, 8u, 8u);
    int _930 = int(_928) & 255;
    int _932 = _930 << 8;
    int _934 = _926 | _932;
    bool _936 = _934 >= 32768;
    int _938 = _934 + (-1024);
    int _940 = _938;
    int _942 = _851;
    int _944 = as_type<int>(_881);
    if (_936)
    {
        int _946 = ~_934;
        int _948 = _946 + 33792;
        int _950 = _948 + 1;
        _940 = _950;
    }
    int _952 = _940;
    int _954 = _952 + 30719;
    float _956 = float(_954);
    float _958 = fma(_956, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _960 = abs(_958);
    float _962 = -_960;
    float _964 = _962 + 1.0;
    float _966 = abs(_958);
    float _968 = fma(_966, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _970 = _958 < 0.0;
    float _972 = float(_970);
    int _974 = as_type<int>(_964) + (-218103808);
    bool _976 = uint(_974) >= 1920991232u;
    float _978 = _767 + 0.5;
    float _980 = abs(_958);
    float _982 = fma(_980, _968, -0.212114393711090087890625);
    float _984 = _915 + 0.5;
    float _986 = abs(_958);
    float _988 = fma(_986, _982, 1.570728778839111328125);
    bool _990 = !_976;
    float _1012;
    if (!_990)
    {
        int _992 = as_type<int>(_964);
        int _994 = _851;
        int _996 = as_type<int>(_881);
        int _998 = 5248;
        int _1000;
        int _1002;
        int _1004;
        int _1006;
        int _1008;
        int _1010;
        _77(_992, _994, _996, _998, _1000, _1002, _1004, _1006, _1008, _1010, out.gl_Position, out.gl_PointSize);
        _1012 = as_type<float>(_1000);
        _942 = _1002;
        _944 = _1008;
        _1014 = true;
    }
    else
    {
        float _1016 = rsqrt(_964);
        float _1018 = _964 * _1016;
        float _1020 = _1016 * 0.5;
        float _1022 = -_1018;
        float _1024 = 0.0 + _1022;
        float _1026 = fma(_1020, _1024, 0.5);
        float _1028 = fma(_1018, _1026, _1018);
        float _1030 = -_1028;
        float _1032 = 0.0 + _1030;
        float _1034 = fma(_1028, _1032, _964);
        float _1036 = fma(_1020, _1034, _1028);
        _1012 = _1036;
    }
    _1014 = false;
    float _1038 = _1012;
    int _1040 = _942;
    int _1042 = _944;
    int _1044 = _913;
    int _1046 = 0;
    int _1048 = _80(_1044, _1046, (*spvDescriptorSet0.support_buffer));
    int _1050 = _432;
    int _1052 = 0;
    int _1054 = _80(_1050, _1052, (*spvDescriptorSet0.support_buffer));
    float4 _1056 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1048, _1054)), 0).xyzw;
    float _1058 = _1056.x;
    float _1060 = _1056.y;
    float _1062 = _1056.z;
    float _1064 = _1056.w;
    float _1066 = floor(_438);
    float _1068 = _988 * _1038;
    float _1070 = _972 * 2.0;
    float _1072 = _956 * 3.883221149444580078125;
    float _1074 = -_1070;
    float _1076 = fma(_1068, _1074, _1068);
    float _1078 = _1072 * 0.15915493667125701904296875;
    float _1080 = fma(_972, 3.1415927410125732421875, _1076);
    float _1082 = _1078 * 6.283185482025146484375;
    float _1084 = cos(_1082);
    float _1086 = _1080 * 0.15915493667125701904296875;
    float _1088 = -_1066;
    float _1090 = _438 + _1088;
    float _1092 = _1086 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = _1078 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = _1094 * _1084;
    float _1102 = _1094 * _1098;
    uint _1104 = as_type<uint>(half2(float2(_1064, 0.0)));
    float _1106 = -_463;
    float _1108 = _1106 + _1062;
    uint _1110 = extract_bits(_1104, 0u, 8u);
    int _1112 = int(_1110) & 255;
    uint _1114 = extract_bits(_1104, 8u, 8u);
    int _1116 = int(_1114) & 255;
    int _1118 = _1116 << 8;
    int _1120 = _1112 | _1118;
    float _1122 = fma(_1090, _1108, _463);
    bool _1124 = _1120 >= 32768;
    int _1126 = _1120 + (-1024);
    int _1128 = _1126;
    if (_1124)
    {
        int _1130 = ~_1120;
        int _1132 = _1130 + 33792;
        int _1134 = _1132 + 1;
        _1128 = _1134;
    }
    int _1136 = _1128;
    int _1138 = _1136 + 30719;
    float _1140 = float(_1138);
    float _1142 = fma(_1140, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1144 = abs(_1142);
    float _1146 = -_1144;
    float _1148 = _1146 + 1.0;
    float _1150 = abs(_1142);
    float _1152 = fma(_1150, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1154 = as_type<int>(_1148) + (-218103808);
    float _1156 = abs(_1142);
    float _1158 = fma(_1156, _1152, -0.212114393711090087890625);
    bool _1160 = _1142 < 0.0;
    float _1162 = float(_1160);
    bool _1164 = uint(_1154) >= 1920991232u;
    float _1166 = -_459;
    float _1168 = _1166 + _1058;
    float _1170 = -_461;
    float _1172 = _1170 + _1060;
    float _1174 = abs(_1142);
    float _1176 = fma(_1174, _1158, 1.570728778839111328125);
    float _1178 = fma(_1090, _1168, _459);
    float _1180 = fma(_1090, _1172, _461);
    bool _1182 = !_1164;
    float _1204;
    if (!_1182)
    {
        int _1184 = as_type<int>(_1148);
        int _1186 = _1040;
        int _1188 = _1042;
        int _1190 = 6128;
        int _1192;
        int _1194;
        int _1196;
        int _1198;
        int _1200;
        int _1202;
        _77(_1184, _1186, _1188, _1190, _1192, _1194, _1196, _1198, _1200, _1202, out.gl_Position, out.gl_PointSize);
        _1204 = as_type<float>(_1192);
        _1206 = true;
    }
    else
    {
        float _1208 = rsqrt(_1148);
        float _1210 = _1148 * _1208;
        float _1212 = _1208 * 0.5;
        float _1214 = -_1210;
        float _1216 = 0.0 + _1214;
        float _1218 = fma(_1212, _1216, 0.5);
        float _1220 = fma(_1210, _1218, _1210);
        float _1222 = -_1220;
        float _1224 = 0.0 + _1222;
        float _1226 = fma(_1220, _1224, _1148);
        float _1228 = fma(_1212, _1226, _1220);
        _1204 = _1228;
    }
    _1206 = false;
    float _1230 = _1204;
    float _1232 = in.m_46.x;
    float _1234 = in.m_46.y;
    float _1236 = in.m_46.z;
    float _1238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1240 = log2(_1238);
    float _1242 = _1176 * _1230;
    float _1244 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1246 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1250 = _1248 != 0;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1258 = _1256 != 0;
    float _1260 = _1140 * 3.883221149444580078125;
    float _1262 = -_958;
    float _1264 = _1262 + _1142;
    bool _1266 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1268 = isnan(1.0);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1274 = _1270 || _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1278 = 1.0 + _1276;
    float _1280 = fma(_1090, _1264, _958);
    float _1282 = _1240 * _114;
    float _1284 = 1.0 / _1278;
    float _1286 = _1236 * 2.0;
    float _1288 = _1232 * 2.0;
    float _1290 = _1234 + _1236;
    float _1292 = exp2(_1282);
    float _1294 = _1234 * 2.0;
    float _1296 = _1290 + (-1.0);
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1300 = floor(_1286);
    float _1302 = _1234 + _1232;
    float _1304 = _1302 + (-1.0);
    float _1306 = floor(_1288);
    float _1308 = -_1292;
    float _1310 = _1308 + 1.0;
    bool _1312 = _1300 > 0.0;
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1316 = _1300 >= 0.0;
    bool _1318 = isnan(_1300);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    float _1326 = floor(_1294);
    float _1328 = in.m_56.x;
    float _1330 = in.m_56.y;
    float _1332 = in.m_56.z;
    bool _1334 = !_1250;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = _1324 ? 0 : 1;
    bool _1340 = _1306 > 0.0;
    bool _1342 = _1306 >= 0.0;
    bool _1344 = isnan(_1306);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    int _1352 = ~_1338;
    int _1354 = _1352 + 1;
    int _1356 = _1354 + 1;
    int _1358 = abs(_1336);
    int _1360 = _1356;
    float _1362 = _1280;
    if (!_1312)
    {
        int _1364 = ~_1338;
        int _1366 = _1364 + 1;
        _1360 = _1366;
    }
    int _1368 = _1360;
    bool _1370 = !_1254;
    int _1372 = _1370 ? 0 : 1;
    int _1374 = _1350 ? 0 : 1;
    float _1376 = float(_1358);
    float _1378 = float(_1368);
    int _1380 = abs(_1372);
    int _1382 = ~_1374;
    int _1384 = _1382 + 1;
    int _1386 = _1384 + 1;
    float _1388 = _1376 * _1378;
    bool _1390 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1392 = isnan(0.0);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1398 = _1394 || _1396;
    int _1400 = _1386;
    if (!_1340)
    {
        int _1402 = ~_1374;
        int _1404 = _1402 + 1;
        _1400 = _1404;
    }
    int _1406 = _1400;
    float _1408 = _1388 * (-2.0);
    float _1410 = _1398 ? _1310 : 0.0;
    float _1412 = float(_1380);
    float _1414 = float(_1406);
    if (_1274)
    {
        float _1416 = _1410 * _1284;
        _132 = _1416;
    }
    float _1418 = _132;
    bool _1420 = _1326 > 0.0;
    float _1422 = _1232 + (-0.5);
    bool _1424 = _1326 >= 0.0;
    bool _1426 = isnan(_1326);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(0.0);
    bool _1432 = _1428 || _1430;
    float _1434 = _1412 * _1414;
    float _1436 = fma(_1408, _1328, _1328);
    float _1438 = fma(_1314, _1408, _1314);
    int _1440 = _1432 ? 0 : 1;
    float _1442 = _1434 * (-2.0);
    float _1444 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1436);
    bool _1446 = !_1258;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = _1232 + _1236;
    int _1452 = ~_1440;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    float _1458 = fma(_1438, _1418, _1444);
    int _1460 = abs(_1448);
    float _1462 = fma(_1298, _1442, _1298);
    int _1464 = _1456;
    if (!_1420)
    {
        int _1466 = ~_1440;
        int _1468 = _1466 + 1;
        _1464 = _1468;
    }
    int _1470 = _1464;
    float _1472 = fma(_1442, _1330, _1330);
    float _1474 = _1234 + (-0.5);
    float _1476 = _1458 * 0.15915493667125701904296875;
    float _1478 = float(_1460);
    float _1480 = _1450 + (-1.0);
    float _1482 = float(_1470);
    float _1484 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1472);
    float _1486 = _1236 + (-0.5);
    float _1488 = _1476 * 6.283185482025146484375;
    float _1490 = sin(_1488);
    bool _1492 = _1180 != 0.0;
    bool _1494 = isnan(_1180);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan(0.0);
    bool _1500 = _1496 || _1498;
    float _1502 = _1478 * _1482;
    float _1504 = fma(_1462, _1418, _1484);
    float _1506 = _1502 * (-2.0);
    float _1508 = _1504 * 0.15915493667125701904296875;
    float _1510 = _1476 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1516 = fma(_1506, _1332, _1332);
    float _1518 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1178);
    float _1520 = _1162 * 2.0;
    float _1522 = fma(_1514, _1506, _1514);
    float _1524 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1516);
    float _1526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1122);
    float _1528 = _1508 * 6.283185482025146484375;
    float _1530 = sin(_1528);
    float _1532 = -_1520;
    float _1534 = fma(_1242, _1532, _1242);
    float _1536 = fma(_1522, _1418, _1524);
    float _1538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1180);
    float _1540 = _1246 * _1526;
    float _1542 = fma(_1162, 3.1415927410125732421875, _1534);
    float _1544 = _1536 * 0.15915493667125701904296875;
    float _1546 = _753 * _1538;
    float _1548 = _1508 * 6.283185482025146484375;
    float _1550 = cos(_1548);
    bool _1552 = _1178 == 0.0;
    bool _1554 = !_1500;
    bool _1556 = _1552 && _1554;
    bool _1558 = _1122 == 0.0;
    bool _1560 = _1558 && _1556;
    float _1562 = _1544 * 6.283185482025146484375;
    float _1564 = cos(_1562);
    float _1566 = _1244 * _1518;
    float _1568 = _1490 * _1530;
    float _1570 = _1512 * _1530;
    float _1572 = _1544 * 6.283185482025146484375;
    float _1574 = sin(_1572);
    float _1576 = _1512 * _1550;
    float _1578 = _1490 * _1550;
    if (!_1560)
    {
        float _1580 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1280);
        _1362 = _1580;
    }
    float _1582 = _1362;
    float _1584 = _1512 * _1564;
    float _1586 = _1490 * _1564;
    float _1588 = _1550 * _1564;
    float _1590 = _1530 * _1564;
    float _1592 = _1584 * _1546;
    float _1594 = _1586 * _1546;
    float _1596 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1598 = fma(_1574, _1576, _1568);
    float _1600 = fma(_1574, _1568, _1576);
    float _1602 = -_1570;
    float _1604 = fma(_1574, _1578, _1602);
    float _1606 = -_1546;
    float _1608 = _1574 * _1606;
    float _1610 = -_1578;
    float _1612 = fma(_1574, _1570, _1610);
    float _1614 = fma(_1598, _1566, _1592);
    float _1616 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1618 = fma(_1588, _1566, _1608);
    float _1620 = fma(_1604, _1566, _1594);
    float _1622 = fma(_1612, _1540, _1614);
    float _1624 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1616);
    float _1626 = fma(_1590, _1540, _1618);
    float _1628 = fma(_1600, _1540, _1620);
    float _1630 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1596);
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1634 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1636 = _1260 * 0.15915493667125701904296875;
    float _1638 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1624);
    float _1640 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1630);
    float _1642 = fma(_1626, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1632);
    float _1644 = fma(_1626, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1634);
    float _1646 = _1638 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1648 = _1640 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1650 = fma(_1628, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1642);
    float _1652 = fma(_1628, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1644);
    float _1654 = _1636 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1660 = _1646 + _1650;
    float _1662 = _1648 + _1652;
    float _1664 = _1542 * 0.15915493667125701904296875;
    float _1666 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1658);
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1670 = _1660 + _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1674 = _1662 + _1672;
    float _1676 = _1636 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1682 = _1670 * _1670;
    float _1684 = _1674 * _1674;
    float _1686 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1666);
    float _1688 = fma(_1626, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1680);
    float _1690 = -_1582;
    float _1692 = _1574 * _1690;
    float _1694 = _1682 + _1684;
    float _1696 = _1664 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    float _1700 = fma(_1628, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1688);
    float _1702 = _1686 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1704 = _1584 * _1582;
    float _1706 = _1702 + _1700;
    float _1708 = sqrt(_1694);
    float _1710 = -_1100;
    float _1712 = fma(_1698, _1656, _1710);
    float _1714 = -_1102;
    float _1716 = fma(_1698, _1678, _1714);
    float _1718 = fma(_1090, _1712, _1100);
    float _1720 = fma(_1090, _1716, _1102);
    bool _1722 = _1708 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1718;
    float _1726 = _1720;
    float _1728 = _1586;
    float _1730 = _1702;
    float _1732 = _1574;
    float _1734 = _1582;
    if (!_1560)
    {
        float _1736 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1718);
        _1724 = _1736;
    }
    float _1738 = _1724;
    float _1740 = _1586 * _1582;
    if (!_1560)
    {
        float _1742 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1720);
        _1726 = _1742;
    }
    float _1744 = _1726;
    if (!_1722)
    {
        _1728 = _1684;
    }
    float _1746 = _1728;
    float _1748 = _1746;
    if (!_1722)
    {
        _1730 = _1682;
    }
    float _1750 = _1730;
    float _1752 = _1750;
    if (!_1722)
    {
        _1732 = _1660;
    }
    float _1754 = _1732;
    float _1756 = _1754;
    if (!_1722)
    {
        _1734 = _1662;
    }
    float _1758 = _1734;
    float _1760 = _1758;
    if (!_1722)
    {
        _268 = _1706;
    }
    float _1762 = _268;
    bool _1764 = !_1722;
    float _1766 = _1762;
    if (!_1764)
    {
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1772 = _1708 + _1770;
        float _1774 = rsqrt(_1694);
        float _1776 = _1772 * _1768;
        float _1778 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1780 = _1776 * 0.15915493667125701904296875;
        float _1782 = _1780 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = _1780 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = fma(_1784, _1778, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1792 = _1774 * _1790;
        float _1794 = _1788 + (-1.0);
        float _1796 = _1670 * _1792;
        float _1798 = _1674 * _1792;
        float _1800 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1802 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1804 = _1798 * _1798;
        float _1806 = fma(_1706, _1788, _1800);
        float _1808 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1810 = _1796 * _1796;
        _1766 = _1806;
        _1752 = _1810;
        _1748 = _1804;
        _1756 = _1808;
        _1760 = _1802;
    }
    float _1812 = _1766;
    float _1814 = _1752;
    float _1816 = _1748;
    float _1818 = _1756;
    float _1820 = _1760;
    float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1824 = _1812 + _1822;
    float _1826 = fma(_1598, _1738, _1704);
    float _1828 = fma(_1588, _1738, _1692);
    float _1830 = fma(_1604, _1738, _1740);
    float _1832 = fma(_1824, _1824, _1814);
    float _1834 = fma(_1612, _1744, _1826);
    float _1836 = fma(_1590, _1744, _1828);
    float _1838 = fma(_1600, _1744, _1830);
    float _1840 = _1832 + _1816;
    float _1842 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1846 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_58.x = _978;
    out.m_58.y = _919;
    out.m_58.z = _984;
    out.m_58.w = _917;
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1842);
    float _1850 = sqrt(_1840);
    float _1852 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1844);
    float _1854 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1846);
    float _1856 = fma(_1838, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1848);
    float _1858 = fma(_1838, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1852);
    float _1860 = fma(_1838, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1854);
    out.m_60.x = _1856;
    out.m_60.y = _1858;
    out.m_60.z = _1860;
    bool _1862 = _1850 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1864 = isnan(_1850);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1870 = _1866 || _1868;
    float _1872 = _1848;
    if (!_1870)
    {
        _1872 = 1.0;
    }
    float _1874 = _1872;
    bool _1876 = !_1870;
    float _1878 = _1874;
    if (!_1876)
    {
        bool _1880 = _1850 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1882 = isnan(_1850);
        bool _1884 = _1880 || _1882;
        bool _1886 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1888 = _1884 || _1886;
        if (!_1888)
        {
            float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1892 = _1850 + _1890;
            float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1896 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1894;
            float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1900 = _1898 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1902 = 1.0 / _1896;
            float _1904 = _1892 * _1902;
            float _1906 = fma(_1904, _1900, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1878 = _1906;
            _1908 = true;
        }
        else
        {
            bool _1910 = _1850 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1912 = isnan(_1850);
            bool _1914 = _1910 || _1912;
            bool _1916 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1918 = _1914 || _1916;
            if (!_1918)
            {
                float _1920 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1922 = _1850 + _1920;
                float _1924 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1926 = _1924 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1928 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1930 = _1928 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1932 = 1.0 / _1926;
                float _1934 = _1922 * _1932;
                float _1936 = fma(_1934, _1930, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1878 = _1936;
                _1908 = true;
            }
            else
            {
                _1878 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1908 = false;
    float _1938 = _1878;
    float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1942 = _1812 + _1940;
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1946 = _1818 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1950 = _1820 + _1948;
    float _1952 = fma(_1942, _1938, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1954 = fma(_1946, _1938, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1956 = fma(_1950, _1938, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1958 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1962 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1966 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1958);
    float _1968 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1960);
    float _1970 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1962);
    float _1972 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1964);
    float _1974 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1966);
    float _1976 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1968);
    float _1978 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1970);
    float _1980 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1972);
    float _1982 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1988 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1990 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1992 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1994 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1996 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1998 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1990);
    float _2000 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1992);
    float _2002 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1994);
    float _2004 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1996);
    float _2006 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1998);
    float _2008 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2000);
    float _2010 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2002);
    float _2012 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2004);
    float _2014 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2006);
    float _2016 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2008);
    float _2018 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2010);
    float _2020 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2012);
    float _2022 = _2014 + _2016;
    float _2024 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2026 = _2022 * 0.5;
    out.m_62.x = _1954;
    out.m_62.y = _1952;
    out.m_62.z = _1956;
    out.m_40.x = _2024;
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _2014;
    out.gl_Position.w = _2016;
    out.m_64.z = _2026;
    out.m_64.w = _2016;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1908 = false;
    bool _1206 = false;
    bool _1014 = false;
    bool _412 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_37.w;
    float _86 = trunc(_84);
    int _88 = int(_86);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_40.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2084 = as_type<float>(_104);
        out.gl_Position.z = _2084;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_42.w;
    float _110 = float(_88);
    float _112 = -_108;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_108);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    bool _126 = _114 >= _110;
    bool _128 = !_124;
    bool _130 = _126 || _128;
    float _132 = _114;
    if (_130)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _96;
    if (_130)
    {
        out.m_40.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _106 = as_type<int>(_136);
    }
    int _138 = _106;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2148 = as_type<float>(_138);
        out.gl_Position.z = _2148;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_44.w;
    float _142 = 1.0 / _110;
    float _144 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_42.x;
    float _158 = in.m_42.y;
    float _160 = in.m_42.z;
    float _162 = in.m_37.x;
    float _164 = in.m_37.y;
    float _166 = in.m_37.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    float _262 = fma(_256, _140, _166);
    float _264 = _114 * _142;
    bool _266 = !_244;
    float _268 = _258;
    float _286;
    if (!_266)
    {
        float _270 = in.m_46.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        _286 = _264;
    }
    _288 = false;
    float _290 = _286;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _302 = 1.0 / _294;
    float _304 = _296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _290 + _306;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _312 = _298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _314 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _316 = isnan(_290);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _328 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_290);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_324;
    float _342 = _340 + 1.0;
    float _344 = _308 * _302;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _348;
    out.m_48.x = _304;
    out.m_48.y = _326;
    out.m_48.z = _312;
    out.m_48.w = _346;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = _338 * _342;
    float _362 = fma(_350, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = fma(_354, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_358, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = -_338;
    float _370 = _368 + 1.0;
    float _372 = _362 * _360;
    float _374 = _364 * _360;
    float _376 = _366 * _360;
    float _378 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _380 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[144].x, _378);
    float _386 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[144].y, _380);
    float _388 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[144].z, _382);
    bool _390 = !_300;
    bool _392 = _300;
    float _410;
    if (!_390)
    {
        float _394 = in.m_46.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        _410 = _264;
    }
    _412 = false;
    float _414 = _410;
    int _416 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _418 = _416;
    int _420 = 0;
    int _422 = _79(_418, _420, (*spvDescriptorSet0.support_buffer));
    float _424 = in.m_50.z;
    float _426 = 0.0 + _264;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = trunc(_424);
    int _432 = int(_430);
    int _434 = _422 + (-1);
    float _436 = float(_434);
    float _438 = _428 * _436;
    float _440 = trunc(_438);
    int _442 = int(_440);
    int _444 = _442;
    int _446 = 0;
    int _448 = _80(_444, _446, (*spvDescriptorSet0.support_buffer));
    int _450 = _432;
    int _452 = 0;
    int _454 = _80(_450, _452, (*spvDescriptorSet0.support_buffer));
    float4 _457 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_448, _454)), 0).xyzw;
    float _459 = _457.x;
    float _461 = _457.y;
    float _463 = _457.z;
    float _465 = _457.w;
    float _467 = in.m_44.x;
    float _469 = in.m_44.y;
    float _471 = in.m_44.z;
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _475 = in.m_50.x;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _479 = _477 != 0;
    float _481 = in.m_46.z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _489 = _487 != 0;
    float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _493 = in.m_46.x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _499 = _497 != 0;
    float _501 = in.m_46.w;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _505 = _503 != 0;
    float _507 = 1.0 / _485;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _511 = _509 != 0;
    float _513 = _384 * _467;
    float _515 = _386 * _469;
    float _517 = in.m_46.y;
    float _519 = _388 * _471;
    float _521 = -_475;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _531 = _529 != 0;
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _535 = _493 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_479)
    {
        bool _537 = _481 > 0.5;
        _392 = _537;
    }
    bool _539 = _392;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _543 = 0.0;
    if (!_479)
    {
        _543 = _475;
    }
    float _545 = _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _551 = _545;
    if (_479)
    {
        float _553 = _539 ? _523 : _475;
        _551 = _553;
    }
    float _555 = _551;
    float _557 = 1.0 / _527;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _561 = _559 != 0;
    float _563 = -_495;
    float _565 = fma(_535, 2.0, _563);
    bool _567 = _501 > 0.5;
    bool _569 = _567 && _511;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _571;
    bool _575 = _493 > 0.5;
    bool _577 = _575 && _499;
    float _579 = 1.0 / _549;
    float _581 = in.m_50.y;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _587 = _517 > 0.5;
    float _589 = _533 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _591 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _593 = isnan(_414);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _605 = _517 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _609 = _517 > 0.5;
    bool _611 = _609 && _505;
    float _613 = fma(_605, -2.0, _541);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _615;
    float _619 = _573 * _507;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _623 = _414 + _621;
    float _625 = _585 * _579;
    float _627 = _617 * _557;
    float _629 = _617;
    float _631 = _619;
    if (!_489)
    {
        _629 = _475;
    }
    float _633 = _629;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _637 = _414 + _635;
    float _639 = _577 ? _523 : _475;
    float _641 = fma(_627, _623, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _645 = _414 + _643;
    float _647 = _633;
    float _649 = _645;
    if (_489)
    {
        float _651 = _587 ? _523 : _475;
        _647 = _651;
    }
    float _653 = _647;
    float _655 = _603 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _657 = -_581;
    float _659 = _657 + 1.0;
    float _661 = fma(_625, _645, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _663 = fma(_619, _637, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _665 = fma(_655, _639, -0.5);
    float _667 = _473 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _669 = _491 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _671 = _569 ? _659 : _581;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _675 = fma(_667, _555, -0.5);
    float _677 = _673;
    if (!_531)
    {
        _649 = _517;
    }
    float _679 = _649;
    float _681 = fma(_669, _671, -0.5);
    float _683 = _679;
    if (_531)
    {
        _683 = _493;
    }
    float _685 = _683;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _689 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _691 = isnan(_414);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _613);
    bool _703 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _705 = isnan(_414);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[78].z, _687);
    float _717 = _687;
    if (!_531)
    {
        _717 = _493;
    }
    float _719 = _717;
    float _721 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].z, _673);
    float _723 = _719;
    if (_531)
    {
        _723 = _481;
    }
    float _725 = _723;
    float _727 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _715);
    if (!_531)
    {
        _677 = _517;
    }
    float _729 = _677;
    float _731 = -_699;
    float _733 = _731 + 1.0;
    float _735 = _729;
    if (_531)
    {
        _735 = _493;
    }
    float _737 = _735;
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[84].z, _607);
    bool _741 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _743 = isnan(_414);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _755 = -_114;
    float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[76].x, _565);
    float _759 = -_601;
    float _761 = _759 + 1.0;
    float _763 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[84].x, _739);
    float _765 = _713 * _733;
    float _767 = fma(_727, _665, _757);
    float _769 = _751 * _761;
    float _771 = -_751;
    float _773 = _771 + 1.0;
    float _775 = _737 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _777 = -_713;
    float _779 = _777 + 1.0;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _783 = _641 * _769;
    float _785 = _763 * (-0.15915493667125701904296875);
    float _787 = -_781;
    float _789 = fma(_775, 2.0, _787);
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_531)
    {
        _631 = _481;
    }
    float _793 = _631;
    float _795 = _601 * _779;
    float _797 = _785 * 6.283185482025146484375;
    float _799 = sin(_797);
    float _801 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[131].x, _783);
    float _803 = _753 * _581;
    bool _805 = _481 > 0.5;
    bool _807 = _805 && _561;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _811 = _793;
    float _813 = _803;
    if (!_531)
    {
        _791 = _793;
    }
    float _815 = _791;
    float _817 = fma(_661, _795, _801);
    float _819 = _785 * 6.283185482025146484375;
    float _821 = cos(_819);
    float _823 = _815;
    if (_531)
    {
        _811 = _517;
    }
    float _825 = _811;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_611)
    {
        float _829 = -_803;
        float _831 = _829 + 1.0;
        _813 = _831;
    }
    float _833 = _813;
    float _835 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[78].w, _809);
    if (_531)
    {
        _823 = _517;
    }
    float _837 = _823;
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[83].w, _827);
    float _841 = fma(_589, _833, -0.5);
    float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _845 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _835);
    float _847 = fma(_663, _765, _817);
    float _849 = _799 * _681;
    int _851 = _807 ? as_type<int>(_659) : as_type<int>(_581);
    float _853 = -_701;
    float _855 = fma(_845, _841, _853);
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _861 = _821 * _681;
    float _863 = _837 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _865 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[134].x, _847);
    float _867 = _653 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _869 = fma(_799, _675, _861);
    float _871 = as_type<float>(_851) * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _873 = fma(_863, -2.0, _857);
    float _875 = _865 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _877 = _871 * _843;
    float _879 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].w, _839);
    float _881 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[81].y, _873);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _885 = _867 * _859;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _889 = -_881;
    float _891 = fma(_879, _869, _889);
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _895 = _442 + 1;
    float _897 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _885;
    out.m_52.y = _877;
    float _903 = -_849;
    float _905 = fma(_821, _675, _903);
    float _907 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[82].z, _721);
    float _909 = -_114;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[81].x, _789);
    out.m_54.x = _897;
    out.m_54.y = _899;
    out.m_54.z = _901;
    out.m_54.w = _875;
    int _913 = min(_434, _895);
    float _915 = fma(_907, _905, _911);
    float _917 = _891 + 0.5;
    float _919 = _855 + 0.5;
    uint _922 = as_type<uint>(half2(float2(_465, 0.0)));
    uint _924 = extract_bits(_922, 0u, 8u);
    int _926 = int(_924) & 255;
    uint _928 = extract_bits(_922, 8u, 8u);
    int _930 = int(_928) & 255;
    int _932 = _930 << 8;
    int _934 = _926 | _932;
    bool _936 = _934 >= 32768;
    int _938 = _934 + (-1024);
    int _940 = _938;
    int _942 = _851;
    int _944 = as_type<int>(_881);
    if (_936)
    {
        int _946 = ~_934;
        int _948 = _946 + 33792;
        int _950 = _948 + 1;
        _940 = _950;
    }
    int _952 = _940;
    int _954 = _952 + 30719;
    float _956 = float(_954);
    float _958 = fma(_956, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _960 = abs(_958);
    float _962 = -_960;
    float _964 = _962 + 1.0;
    float _966 = abs(_958);
    float _968 = fma(_966, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _970 = _958 < 0.0;
    float _972 = float(_970);
    int _974 = as_type<int>(_964) + (-218103808);
    bool _976 = uint(_974) >= 1920991232u;
    float _978 = _767 + 0.5;
    float _980 = abs(_958);
    float _982 = fma(_980, _968, -0.212114393711090087890625);
    float _984 = _915 + 0.5;
    float _986 = abs(_958);
    float _988 = fma(_986, _982, 1.570728778839111328125);
    bool _990 = !_976;
    float _1012;
    if (!_990)
    {
        int _992 = as_type<int>(_964);
        int _994 = _851;
        int _996 = as_type<int>(_881);
        int _998 = 5248;
        int _1000;
        int _1002;
        int _1004;
        int _1006;
        int _1008;
        int _1010;
        _77(_992, _994, _996, _998, _1000, _1002, _1004, _1006, _1008, _1010, out.gl_Position, out.gl_PointSize);
        _1012 = as_type<float>(_1000);
        _942 = _1002;
        _944 = _1008;
        _1014 = true;
    }
    else
    {
        float _1016 = rsqrt(_964);
        float _1018 = _964 * _1016;
        float _1020 = _1016 * 0.5;
        float _1022 = -_1018;
        float _1024 = 0.0 + _1022;
        float _1026 = fma(_1020, _1024, 0.5);
        float _1028 = fma(_1018, _1026, _1018);
        float _1030 = -_1028;
        float _1032 = 0.0 + _1030;
        float _1034 = fma(_1028, _1032, _964);
        float _1036 = fma(_1020, _1034, _1028);
        _1012 = _1036;
    }
    _1014 = false;
    float _1038 = _1012;
    int _1040 = _942;
    int _1042 = _944;
    int _1044 = _913;
    int _1046 = 0;
    int _1048 = _80(_1044, _1046, (*spvDescriptorSet0.support_buffer));
    int _1050 = _432;
    int _1052 = 0;
    int _1054 = _80(_1050, _1052, (*spvDescriptorSet0.support_buffer));
    float4 _1056 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1048, _1054)), 0).xyzw;
    float _1058 = _1056.x;
    float _1060 = _1056.y;
    float _1062 = _1056.z;
    float _1064 = _1056.w;
    float _1066 = floor(_438);
    float _1068 = _988 * _1038;
    float _1070 = _972 * 2.0;
    float _1072 = _956 * 3.883221149444580078125;
    float _1074 = -_1070;
    float _1076 = fma(_1068, _1074, _1068);
    float _1078 = _1072 * 0.15915493667125701904296875;
    float _1080 = fma(_972, 3.1415927410125732421875, _1076);
    float _1082 = _1078 * 6.283185482025146484375;
    float _1084 = cos(_1082);
    float _1086 = _1080 * 0.15915493667125701904296875;
    float _1088 = -_1066;
    float _1090 = _438 + _1088;
    float _1092 = _1086 * 6.283185482025146484375;
    float _1094 = sin(_1092);
    float _1096 = _1078 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = _1094 * _1084;
    float _1102 = _1094 * _1098;
    uint _1104 = as_type<uint>(half2(float2(_1064, 0.0)));
    float _1106 = -_463;
    float _1108 = _1106 + _1062;
    uint _1110 = extract_bits(_1104, 0u, 8u);
    int _1112 = int(_1110) & 255;
    uint _1114 = extract_bits(_1104, 8u, 8u);
    int _1116 = int(_1114) & 255;
    int _1118 = _1116 << 8;
    int _1120 = _1112 | _1118;
    float _1122 = fma(_1090, _1108, _463);
    bool _1124 = _1120 >= 32768;
    int _1126 = _1120 + (-1024);
    int _1128 = _1126;
    if (_1124)
    {
        int _1130 = ~_1120;
        int _1132 = _1130 + 33792;
        int _1134 = _1132 + 1;
        _1128 = _1134;
    }
    int _1136 = _1128;
    int _1138 = _1136 + 30719;
    float _1140 = float(_1138);
    float _1142 = fma(_1140, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1144 = abs(_1142);
    float _1146 = -_1144;
    float _1148 = _1146 + 1.0;
    float _1150 = abs(_1142);
    float _1152 = fma(_1150, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1154 = as_type<int>(_1148) + (-218103808);
    float _1156 = abs(_1142);
    float _1158 = fma(_1156, _1152, -0.212114393711090087890625);
    bool _1160 = _1142 < 0.0;
    float _1162 = float(_1160);
    bool _1164 = uint(_1154) >= 1920991232u;
    float _1166 = -_459;
    float _1168 = _1166 + _1058;
    float _1170 = -_461;
    float _1172 = _1170 + _1060;
    float _1174 = abs(_1142);
    float _1176 = fma(_1174, _1158, 1.570728778839111328125);
    float _1178 = fma(_1090, _1168, _459);
    float _1180 = fma(_1090, _1172, _461);
    bool _1182 = !_1164;
    float _1204;
    if (!_1182)
    {
        int _1184 = as_type<int>(_1148);
        int _1186 = _1040;
        int _1188 = _1042;
        int _1190 = 6128;
        int _1192;
        int _1194;
        int _1196;
        int _1198;
        int _1200;
        int _1202;
        _77(_1184, _1186, _1188, _1190, _1192, _1194, _1196, _1198, _1200, _1202, out.gl_Position, out.gl_PointSize);
        _1204 = as_type<float>(_1192);
        _1206 = true;
    }
    else
    {
        float _1208 = rsqrt(_1148);
        float _1210 = _1148 * _1208;
        float _1212 = _1208 * 0.5;
        float _1214 = -_1210;
        float _1216 = 0.0 + _1214;
        float _1218 = fma(_1212, _1216, 0.5);
        float _1220 = fma(_1210, _1218, _1210);
        float _1222 = -_1220;
        float _1224 = 0.0 + _1222;
        float _1226 = fma(_1220, _1224, _1148);
        float _1228 = fma(_1212, _1226, _1220);
        _1204 = _1228;
    }
    _1206 = false;
    float _1230 = _1204;
    float _1232 = in.m_46.x;
    float _1234 = in.m_46.y;
    float _1236 = in.m_46.z;
    float _1238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1240 = log2(_1238);
    float _1242 = _1176 * _1230;
    float _1244 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1246 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1250 = _1248 != 0;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1258 = _1256 != 0;
    float _1260 = _1140 * 3.883221149444580078125;
    float _1262 = -_958;
    float _1264 = _1262 + _1142;
    bool _1266 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1268 = isnan(1.0);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1274 = _1270 || _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1278 = 1.0 + _1276;
    float _1280 = fma(_1090, _1264, _958);
    float _1282 = _1240 * _114;
    float _1284 = 1.0 / _1278;
    float _1286 = _1236 * 2.0;
    float _1288 = _1232 * 2.0;
    float _1290 = _1234 + _1236;
    float _1292 = exp2(_1282);
    float _1294 = _1234 * 2.0;
    float _1296 = _1290 + (-1.0);
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1300 = floor(_1286);
    float _1302 = _1234 + _1232;
    float _1304 = _1302 + (-1.0);
    float _1306 = floor(_1288);
    float _1308 = -_1292;
    float _1310 = _1308 + 1.0;
    bool _1312 = _1300 > 0.0;
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1316 = _1300 >= 0.0;
    bool _1318 = isnan(_1300);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    float _1326 = floor(_1294);
    float _1328 = in.m_56.x;
    float _1330 = in.m_56.y;
    float _1332 = in.m_56.z;
    bool _1334 = !_1250;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = _1324 ? 0 : 1;
    bool _1340 = _1306 > 0.0;
    bool _1342 = _1306 >= 0.0;
    bool _1344 = isnan(_1306);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    int _1352 = ~_1338;
    int _1354 = _1352 + 1;
    int _1356 = _1354 + 1;
    int _1358 = abs(_1336);
    int _1360 = _1356;
    float _1362 = _1280;
    if (!_1312)
    {
        int _1364 = ~_1338;
        int _1366 = _1364 + 1;
        _1360 = _1366;
    }
    int _1368 = _1360;
    bool _1370 = !_1254;
    int _1372 = _1370 ? 0 : 1;
    int _1374 = _1350 ? 0 : 1;
    float _1376 = float(_1358);
    float _1378 = float(_1368);
    int _1380 = abs(_1372);
    int _1382 = ~_1374;
    int _1384 = _1382 + 1;
    int _1386 = _1384 + 1;
    float _1388 = _1376 * _1378;
    bool _1390 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1392 = isnan(0.0);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1398 = _1394 || _1396;
    int _1400 = _1386;
    if (!_1340)
    {
        int _1402 = ~_1374;
        int _1404 = _1402 + 1;
        _1400 = _1404;
    }
    int _1406 = _1400;
    float _1408 = _1388 * (-2.0);
    float _1410 = _1398 ? _1310 : 0.0;
    float _1412 = float(_1380);
    float _1414 = float(_1406);
    if (_1274)
    {
        float _1416 = _1410 * _1284;
        _132 = _1416;
    }
    float _1418 = _132;
    bool _1420 = _1326 > 0.0;
    float _1422 = _1232 + (-0.5);
    bool _1424 = _1326 >= 0.0;
    bool _1426 = isnan(_1326);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(0.0);
    bool _1432 = _1428 || _1430;
    float _1434 = _1412 * _1414;
    float _1436 = fma(_1408, _1328, _1328);
    float _1438 = fma(_1314, _1408, _1314);
    int _1440 = _1432 ? 0 : 1;
    float _1442 = _1434 * (-2.0);
    float _1444 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1436);
    bool _1446 = !_1258;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = _1232 + _1236;
    int _1452 = ~_1440;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    float _1458 = fma(_1438, _1418, _1444);
    int _1460 = abs(_1448);
    float _1462 = fma(_1298, _1442, _1298);
    int _1464 = _1456;
    if (!_1420)
    {
        int _1466 = ~_1440;
        int _1468 = _1466 + 1;
        _1464 = _1468;
    }
    int _1470 = _1464;
    float _1472 = fma(_1442, _1330, _1330);
    float _1474 = _1234 + (-0.5);
    float _1476 = _1458 * 0.15915493667125701904296875;
    float _1478 = float(_1460);
    float _1480 = _1450 + (-1.0);
    float _1482 = float(_1470);
    float _1484 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1472);
    float _1486 = _1236 + (-0.5);
    float _1488 = _1476 * 6.283185482025146484375;
    float _1490 = sin(_1488);
    bool _1492 = _1180 != 0.0;
    bool _1494 = isnan(_1180);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan(0.0);
    bool _1500 = _1496 || _1498;
    float _1502 = _1478 * _1482;
    float _1504 = fma(_1462, _1418, _1484);
    float _1506 = _1502 * (-2.0);
    float _1508 = _1504 * 0.15915493667125701904296875;
    float _1510 = _1476 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1516 = fma(_1506, _1332, _1332);
    float _1518 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1178);
    float _1520 = _1162 * 2.0;
    float _1522 = fma(_1514, _1506, _1514);
    float _1524 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1516);
    float _1526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1122);
    float _1528 = _1508 * 6.283185482025146484375;
    float _1530 = sin(_1528);
    float _1532 = -_1520;
    float _1534 = fma(_1242, _1532, _1242);
    float _1536 = fma(_1522, _1418, _1524);
    float _1538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1180);
    float _1540 = _1246 * _1526;
    float _1542 = fma(_1162, 3.1415927410125732421875, _1534);
    float _1544 = _1536 * 0.15915493667125701904296875;
    float _1546 = _753 * _1538;
    float _1548 = _1508 * 6.283185482025146484375;
    float _1550 = cos(_1548);
    bool _1552 = _1178 == 0.0;
    bool _1554 = !_1500;
    bool _1556 = _1552 && _1554;
    bool _1558 = _1122 == 0.0;
    bool _1560 = _1558 && _1556;
    float _1562 = _1544 * 6.283185482025146484375;
    float _1564 = cos(_1562);
    float _1566 = _1244 * _1518;
    float _1568 = _1490 * _1530;
    float _1570 = _1512 * _1530;
    float _1572 = _1544 * 6.283185482025146484375;
    float _1574 = sin(_1572);
    float _1576 = _1512 * _1550;
    float _1578 = _1490 * _1550;
    if (!_1560)
    {
        float _1580 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1280);
        _1362 = _1580;
    }
    float _1582 = _1362;
    float _1584 = _1512 * _1564;
    float _1586 = _1490 * _1564;
    float _1588 = _1550 * _1564;
    float _1590 = _1530 * _1564;
    float _1592 = _1584 * _1546;
    float _1594 = _1586 * _1546;
    float _1596 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1598 = fma(_1574, _1576, _1568);
    float _1600 = fma(_1574, _1568, _1576);
    float _1602 = -_1570;
    float _1604 = fma(_1574, _1578, _1602);
    float _1606 = -_1546;
    float _1608 = _1574 * _1606;
    float _1610 = -_1578;
    float _1612 = fma(_1574, _1570, _1610);
    float _1614 = fma(_1598, _1566, _1592);
    float _1616 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1618 = fma(_1588, _1566, _1608);
    float _1620 = fma(_1604, _1566, _1594);
    float _1622 = fma(_1612, _1540, _1614);
    float _1624 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1616);
    float _1626 = fma(_1590, _1540, _1618);
    float _1628 = fma(_1600, _1540, _1620);
    float _1630 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1596);
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1634 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1636 = _1260 * 0.15915493667125701904296875;
    float _1638 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1624);
    float _1640 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1630);
    float _1642 = fma(_1626, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1632);
    float _1644 = fma(_1626, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1634);
    float _1646 = _1638 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1648 = _1640 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1650 = fma(_1628, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1642);
    float _1652 = fma(_1628, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1644);
    float _1654 = _1636 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1660 = _1646 + _1650;
    float _1662 = _1648 + _1652;
    float _1664 = _1542 * 0.15915493667125701904296875;
    float _1666 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1658);
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1670 = _1660 + _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1674 = _1662 + _1672;
    float _1676 = _1636 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1682 = _1670 * _1670;
    float _1684 = _1674 * _1674;
    float _1686 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1666);
    float _1688 = fma(_1626, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1680);
    float _1690 = -_1582;
    float _1692 = _1574 * _1690;
    float _1694 = _1682 + _1684;
    float _1696 = _1664 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    float _1700 = fma(_1628, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1688);
    float _1702 = _1686 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1704 = _1584 * _1582;
    float _1706 = _1702 + _1700;
    float _1708 = sqrt(_1694);
    float _1710 = -_1100;
    float _1712 = fma(_1698, _1656, _1710);
    float _1714 = -_1102;
    float _1716 = fma(_1698, _1678, _1714);
    float _1718 = fma(_1090, _1712, _1100);
    float _1720 = fma(_1090, _1716, _1102);
    bool _1722 = _1708 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1718;
    float _1726 = _1720;
    float _1728 = _1586;
    float _1730 = _1702;
    float _1732 = _1574;
    float _1734 = _1582;
    if (!_1560)
    {
        float _1736 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1718);
        _1724 = _1736;
    }
    float _1738 = _1724;
    float _1740 = _1586 * _1582;
    if (!_1560)
    {
        float _1742 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1720);
        _1726 = _1742;
    }
    float _1744 = _1726;
    if (!_1722)
    {
        _1728 = _1684;
    }
    float _1746 = _1728;
    float _1748 = _1746;
    if (!_1722)
    {
        _1730 = _1682;
    }
    float _1750 = _1730;
    float _1752 = _1750;
    if (!_1722)
    {
        _1732 = _1660;
    }
    float _1754 = _1732;
    float _1756 = _1754;
    if (!_1722)
    {
        _1734 = _1662;
    }
    float _1758 = _1734;
    float _1760 = _1758;
    if (!_1722)
    {
        _268 = _1706;
    }
    float _1762 = _268;
    bool _1764 = !_1722;
    float _1766 = _1762;
    if (!_1764)
    {
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1772 = _1708 + _1770;
        float _1774 = rsqrt(_1694);
        float _1776 = _1772 * _1768;
        float _1778 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1780 = _1776 * 0.15915493667125701904296875;
        float _1782 = _1780 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = _1780 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = fma(_1784, _1778, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1792 = _1774 * _1790;
        float _1794 = _1788 + (-1.0);
        float _1796 = _1670 * _1792;
        float _1798 = _1674 * _1792;
        float _1800 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1802 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1804 = _1798 * _1798;
        float _1806 = fma(_1706, _1788, _1800);
        float _1808 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1810 = _1796 * _1796;
        _1766 = _1806;
        _1752 = _1810;
        _1748 = _1804;
        _1756 = _1808;
        _1760 = _1802;
    }
    float _1812 = _1766;
    float _1814 = _1752;
    float _1816 = _1748;
    float _1818 = _1756;
    float _1820 = _1760;
    float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1824 = _1812 + _1822;
    float _1826 = fma(_1598, _1738, _1704);
    float _1828 = fma(_1588, _1738, _1692);
    float _1830 = fma(_1604, _1738, _1740);
    float _1832 = fma(_1824, _1824, _1814);
    float _1834 = fma(_1612, _1744, _1826);
    float _1836 = fma(_1590, _1744, _1828);
    float _1838 = fma(_1600, _1744, _1830);
    float _1840 = _1832 + _1816;
    float _1842 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1846 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_58.x = _978;
    out.m_58.y = _919;
    out.m_58.z = _984;
    out.m_58.w = _917;
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1842);
    float _1850 = sqrt(_1840);
    float _1852 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1844);
    float _1854 = fma(_1836, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1846);
    float _1856 = fma(_1838, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1848);
    float _1858 = fma(_1838, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1852);
    float _1860 = fma(_1838, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1854);
    out.m_60.x = _1856;
    out.m_60.y = _1858;
    out.m_60.z = _1860;
    bool _1862 = _1850 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1864 = isnan(_1850);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1870 = _1866 || _1868;
    float _1872 = _1848;
    if (!_1870)
    {
        _1872 = 1.0;
    }
    float _1874 = _1872;
    bool _1876 = !_1870;
    float _1878 = _1874;
    if (!_1876)
    {
        bool _1880 = _1850 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1882 = isnan(_1850);
        bool _1884 = _1880 || _1882;
        bool _1886 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1888 = _1884 || _1886;
        if (!_1888)
        {
            float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1892 = _1850 + _1890;
            float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1896 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1894;
            float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1900 = _1898 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1902 = 1.0 / _1896;
            float _1904 = _1892 * _1902;
            float _1906 = fma(_1904, _1900, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1878 = _1906;
            _1908 = true;
        }
        else
        {
            bool _1910 = _1850 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1912 = isnan(_1850);
            bool _1914 = _1910 || _1912;
            bool _1916 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1918 = _1914 || _1916;
            if (!_1918)
            {
                float _1920 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1922 = _1850 + _1920;
                float _1924 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1926 = _1924 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1928 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1930 = _1928 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1932 = 1.0 / _1926;
                float _1934 = _1922 * _1932;
                float _1936 = fma(_1934, _1930, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1878 = _1936;
                _1908 = true;
            }
            else
            {
                _1878 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1908 = false;
    float _1938 = _1878;
    float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1942 = _1812 + _1940;
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1946 = _1818 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1950 = _1820 + _1948;
    float _1952 = fma(_1942, _1938, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1954 = fma(_1946, _1938, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1956 = fma(_1950, _1938, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1958 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1962 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1966 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1958);
    float _1968 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1960);
    float _1970 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1962);
    float _1972 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1964);
    float _1974 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1966);
    float _1976 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1968);
    float _1978 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1970);
    float _1980 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1972);
    float _1982 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1984 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1988 = _1980 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1990 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1992 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1994 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1996 = _1982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1998 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1990);
    float _2000 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1992);
    float _2002 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1994);
    float _2004 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1996);
    float _2006 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1998);
    float _2008 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2000);
    float _2010 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2002);
    float _2012 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2004);
    float _2014 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2006);
    float _2016 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2008);
    float _2018 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2010);
    float _2020 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2012);
    float _2022 = _2014 + _2016;
    float _2024 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2026 = _2022 * 0.5;
    out.m_62.x = _1954;
    out.m_62.y = _1952;
    out.m_62.z = _1956;
    out.m_40.x = _2024;
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _2014;
    out.gl_Position.w = _2016;
    out.m_64.z = _2026;
    out.m_64.w = _2016;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

